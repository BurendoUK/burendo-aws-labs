resource "aws_iam_instance_profile" "wordpress_srv" {
  name = "wordpress-srv"
  role = aws_iam_role.wordpress_srv.name
}

resource "aws_iam_role" "wordpress_srv" {
  name = "wordpress-srv"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })

  tags = {
    tag-key = "wordpress-srv"
  }
}

data "aws_iam_policy_document" "wordpress_srv" {
  statement {
    sid = "RDS"

    actions = [
      "rds:DescribeDBInstances",
    ]

    resources = [
      "arn:aws:rds:eu-west-2:*:db:*"
    ]
  }

  statement {
    sid = "SecretsManager"

    actions = [
      "secretsmanager:GetRandomPassword",
      "secretsmanager:GetResourcePolicy",
      "secretsmanager:GetSecretValue",
      "secretsmanager:DescribeSecret",
      "secretsmanager:ListSecretVersionIds"
    ]

    resources = [
      aws_secretsmanager_secret.wordpress_rds_admin.arn,
      aws_secretsmanager_secret.wordpress_rds_password.arn,
    ]
  }
}

resource "aws_iam_policy" "wordpress_srv_resources" {
  name   = "wordpress-srv-resources"
  policy = data.aws_iam_policy_document.wordpress_srv.json
}

resource "aws_iam_policy_attachment" "wordpress_srv_resources" {
  name       = "wordpress-srv-resources"
  roles      = [aws_iam_role.wordpress_srv.name]
  policy_arn = aws_iam_policy.wordpress_srv_resources.arn
}

resource "aws_iam_policy_attachment" "wordpress_srv_ssm" {
  name       = "wordpress-srv-ssm"
  roles      = [aws_iam_role.wordpress_srv.name]
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}
