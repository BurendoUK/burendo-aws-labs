resource "aws_autoscaling_group" "wordpress_srv" {
  desired_capacity = 1
  max_size         = 1
  min_size         = 1

  vpc_zone_identifier = [for subnet in aws_subnet.public_wordpress : subnet.id]
  target_group_arns   = [aws_lb_target_group.wordpress_web.arn]

  launch_template {
    id      = aws_launch_template.wordpress_srv.id
    version = "$Latest"
  }
}

resource "aws_launch_template" "wordpress_srv" {
  name = "wordpress-srv"

  ebs_optimized                        = true
  image_id                             = data.aws_ami.al2.id
  instance_initiated_shutdown_behavior = "terminate"
  instance_type                        = var.ec2_instance_class

  iam_instance_profile {
    arn = aws_iam_instance_profile.wordpress_srv.arn
  }

  monitoring {
    enabled = true
  }

  network_interfaces {
    associate_public_ip_address = true
    security_groups             = [aws_security_group.wordpress_srv.id]
  }

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "wordpress-srv"
    }
  }

  user_data = base64encode(
    templatefile("${path.module}/files/ec2-wordpress-install.sh",
      {
        wordpress_admin_secret_id    = "${aws_secretsmanager_secret.wordpress_rds_admin.name}"
        wordpress_password_secret_id = "${aws_secretsmanager_secret.wordpress_rds_password.name}"
        wordpress_rds_host_id        = "${aws_db_instance.wordpress_db.identifier}"
      }
    )
  )

  depends_on = [
    aws_secretsmanager_secret.wordpress_rds_admin, aws_secretsmanager_secret.wordpress_rds_password
  ]
}
