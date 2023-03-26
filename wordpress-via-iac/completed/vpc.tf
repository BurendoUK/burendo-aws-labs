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

  map_public_ip_on_launch = false # This triggers a public IP for all instances within the subnet

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

resource "aws_default_route_table" "wordpress_routetable" {
  default_route_table_id = aws_vpc.wordpress.default_route_table_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}
