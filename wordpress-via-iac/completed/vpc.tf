resource "aws_vpc" "wordpress" {
  cidr_block = local.vpc_cidr_block

  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "wordpress-vpc"
  }
}

resource "aws_subnet" "private_wordpress" {
  for_each = local.private_cidr_sets

  vpc_id            = aws_vpc.wordpress.id
  cidr_block        = each.value.range
  availability_zone = each.value.az

  tags = {
    Name = "private-wordpress-${each.key}"
  }
}

resource "aws_subnet" "public_wordpress" {
  for_each = local.public_cidr_sets

  vpc_id            = aws_vpc.wordpress.id
  cidr_block        = each.value.range
  availability_zone = each.value.az

  map_public_ip_on_launch = true # This triggers a public IP for all instances within the subnet

  tags = {
    Name = "public-wordpress-${each.key}"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.wordpress.id

  tags = {
    Name = "wordpress-igw"
  }
}

resource "aws_route_table" "public_wordpress_rt" {
  vpc_id = aws_vpc.wordpress.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "wordpress-public-route-table"
  }
}

resource "aws_route_table" "private_wordpress_rt" {
  vpc_id = aws_vpc.wordpress.id
  tags = {
    Name = "wordpress-private-route-table"
  }
}

resource "aws_route_table_association" "public" {
  for_each       = aws_subnet.public_wordpress
  subnet_id      = each.value.id
  route_table_id = aws_route_table.public_wordpress_rt.id
}

resource "aws_route_table_association" "private" {
  for_each       = aws_subnet.private_wordpress
  subnet_id      = each.value.id
  route_table_id = aws_route_table.private_wordpress_rt.id
}
