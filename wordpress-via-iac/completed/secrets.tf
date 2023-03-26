resource "aws_secretsmanager_secret" "wordpress_rds_credentials" {
  name = "wordpress-rds-credentials"
}
