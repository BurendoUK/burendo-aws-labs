resource "aws_vpc" "wordpress" {
  cidr_block = "10.0.0.0/24"

  tags = {
    Name = "wordpress-vpc"
  }
}

resource "aws_subnet" "private-wordpress-1" {
  vpc_id     = aws_vpc.wordpress.id
  cidr_block = "10.0.0.0/27" # 30 IPs

  tags = {
    Name = "private-wordpress-1"
  }
}

resource "aws_subnet" "public-wordpress-1" {
  vpc_id     = aws_vpc.wordpress.id
  cidr_block = "10.0.0.32/27" # 30 IPs

  tags = {
    Name = "public-wordpress-1"
  }
}
