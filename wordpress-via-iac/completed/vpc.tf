resource "aws_vpc" "wordpress" {
  cidr_block = local.vpc_cidr_block

  tags = {
    Name = "wordpress-vpc"
  }
}

resource "aws_subnet" "private-wordpress" {
  for_each = local.private_cidr_sets

  vpc_id            = aws_vpc.wordpress.id
  cidr_block        = each.value.range
  availability_zone = each.value.az

  tags = {
    Name = "private-wordpress-${each.key}"
  }
}

resource "aws_subnet" "public-wordpress" {
  for_each = local.public_cidr_sets

  vpc_id            = aws_vpc.wordpress.id
  cidr_block        = each.value.range
  availability_zone = each.value.az

  map_public_ip_on_launch = false # This triggers a public IP for all instances within the subnet

  tags = {
    Name = "public-wordpress-${each.key}"
  }
}
