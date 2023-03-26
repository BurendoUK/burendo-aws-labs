resource "aws_vpc_endpoint" "ssm" {
  vpc_id              = aws_vpc.wordpress.id
  vpc_endpoint_type   = "Interface"
  service_name        = "com.amazonaws.${var.aws_region}.ssm"
  security_group_ids  = [aws_security_group.wordpress_endpoints.id]
  subnet_ids          = [for subnet in aws_subnet.public_wordpress : subnet.id]
  private_dns_enabled = true
}

resource "aws_vpc_endpoint" "ec2messages" {
  vpc_id              = aws_vpc.wordpress.id
  vpc_endpoint_type   = "Interface"
  service_name        = "com.amazonaws.${var.aws_region}.ec2messages"
  security_group_ids  = [aws_security_group.wordpress_endpoints.id]
  subnet_ids          = [for subnet in aws_subnet.public_wordpress : subnet.id]
  private_dns_enabled = true
}
resource "aws_vpc_endpoint" "ssmmessages" {
  vpc_id              = aws_vpc.wordpress.id
  vpc_endpoint_type   = "Interface"
  service_name        = "com.amazonaws.${var.aws_region}.ssmmessages"
  security_group_ids  = [aws_security_group.wordpress_endpoints.id]
  subnet_ids          = [for subnet in aws_subnet.public_wordpress : subnet.id]
  private_dns_enabled = true
}
