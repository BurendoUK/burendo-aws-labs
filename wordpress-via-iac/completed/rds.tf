resource "aws_db_subnet_group" "wordpress_db" {
  name       = "wordpress_db"
  subnet_ids = [for subnet in aws_subnet.private_wordpress : subnet.id]

  tags = {
    Name = "wordpress-db"
  }
}

resource "aws_db_instance" "wordpress_db" {
  allocated_storage      = 10
  identifier             = "wordpress-db"
  db_name                = "wordpress"
  engine                 = "mysql"
  engine_version         = "5.7"
  instance_class         = "db.t3.micro"
  username               = aws_secretsmanager_secret_version.wordpress_rds_admin.secret_string
  password               = aws_secretsmanager_secret_version.wordpress_rds_password.secret_string
  parameter_group_name   = "default.mysql5.7"
  db_subnet_group_name   = aws_db_subnet_group.wordpress_db.name
  vpc_security_group_ids = [aws_security_group.rds.id]
  skip_final_snapshot    = true
}
