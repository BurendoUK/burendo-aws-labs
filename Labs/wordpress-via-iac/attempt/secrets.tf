# This file is incomplete. A section has been completed for you already but mandatory values for some resources are missing.
resource "random_password" "wordpress_rds_admin" {
  length           = 8
  special          = true
  override_special = "_!%^"
}

resource "random_password" "wordpress_rds_password" {
  length           = 16
  special          = true
  override_special = "_!%^"
}

# From this point onwards - Do not assume all resources are complete.
resource "aws_secretsmanager_secret" "wordpress_rds_admin" {
  name = "wordpress-rds-admin"
}

resource "aws_secretsmanager_secret_version" "wordpress_rds_admin" {
  secret_id     = aws_secretsmanager_secret.wordpress_rds_admin.id
  secret_string = random_password.wordpress_rds_admin.result
}

resource "aws_secretsmanager_secret" "wordpress_rds_password" {
}

resource "aws_secretsmanager_secret_version" "wordpress_rds_password" {
  secret_id = aws_secretsmanager_secret.wordpress_rds_password.id
}
