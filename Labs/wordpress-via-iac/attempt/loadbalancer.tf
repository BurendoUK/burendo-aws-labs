# This file is incomplete. A section has been completed for you already but a section is missing.
resource "aws_lb" "wordpress_web" {
  name               = "wordpress-web"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.wordpress_lb.id]
  subnets            = [for subnet in aws_subnet.public_wordpress : subnet.id]

  enable_deletion_protection = false

  depends_on = [aws_internet_gateway.igw]
}

resource "aws_lb_listener" "wordpress_web" {
  load_balancer_arn = aws_lb.wordpress_web.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.wordpress_web.arn
  }
}

# Something is missing - what else does a load balancer need to be fully operational?
