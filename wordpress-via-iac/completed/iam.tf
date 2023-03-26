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

resource "aws_iam_policy_attachment" "wordpress_srv" {
  name       = "wordpress-srv-ssm"
  roles      = [aws_iam_role.wordpress_srv.name]
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}
