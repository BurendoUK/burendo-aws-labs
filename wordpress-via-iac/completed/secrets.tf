# Random admin username
resource "random_password" "wordpress_rds_admin" {
  length           = 8
  special          = true
  override_special = "_!%^"
}

resource "aws_secretsmanager_secret" "wordpress_rds_admin" {
  name = "wordpress-rds-admin"
}

resource "aws_secretsmanager_secret_version" "wordpress_rds_admin" {
  secret_id     = aws_secretsmanager_secret.wordpress_rds_admin.id
  secret_string = random_password.wordpress_rds_admin.result
}

# Random password
resource "random_password" "wordpress_rds_password" {
  length           = 16
  special          = true
  override_special = "_!%^"
}

resource "aws_secretsmanager_secret" "wordpress_rds_password" {
  name = "wordpress-rds-password"
}

resource "aws_secretsmanager_secret_version" "wordpress_rds_password" {
  secret_id     = aws_secretsmanager_secret.wordpress_rds_password.id
  secret_string = random_password.wordpress_rds_password.result
}
