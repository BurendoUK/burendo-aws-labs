data "aws_availability_zones" "available" {
  state = "available"
}

data "aws_ami" "al2" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-5.10-hvm-2.0.20230320.0-x86_64-gp2"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["137112412989"] # Amazon
}


# data "aws_secretsmanager_secret" "wordpress_rds_admin" {
#   name = aws_secretsmanager_secret.wordpress_rds_admin.name
#   depends_on = [
#     aws_secretsmanager_secret.wordpress_rds_admin
#   ]
# }

# data "aws_secretsmanager_secret_version" "wordpress_rds_admin" {
#   secret_id = data.aws_secretsmanager_secret.wordpress_rds_admin.id
# }


# data "aws_secretsmanager_secret" "wordpress_rds_password" {
#   name = aws_secretsmanager_secret.wordpress_rds_password.name
#   depends_on = [
#     aws_secretsmanager_secret.wordpress_rds_password
#   ]
# }

# data "aws_secretsmanager_secret_version" "wordpress_rds_password" {
#   secret_id = data.aws_secretsmanager_secret.wordpress_rds_password.id
# }
