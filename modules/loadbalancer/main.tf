#Add an Jenkins Load Balancer
resource "aws_elb" "jenkins-lb" {
  name            = var.jenkins-lb-name
  subnets         = var.priv_sn1
  security_groups = [var.jenkins_sg]

  listener {
    instance_port     = 8080
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "TCP:8080"
    interval            = 30
  }

  instances                   = [var.jenkins_server]
  cross_zone_load_balancing   = true
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 400

  tags = {
    Name = var.jenkins-lb-name
  }
}

# Add an Docker Load Balancer
resource "aws_lb" "Docker-lb" {
  name            = var.docker-lb-name
  internal        = false
  load_balancer_type = "application"
  subnets         = var.priv_sn2
  security_groups = [var.docker_sg]

  tags = {
    Name = var.docker-lb-name
  }
}
resource "aws_lb_target_group" "docker_tg" {
  name     = var.docker_tg_name
  port     = 8085
  protocol = "HTTP"
  vpc_id   = var.vpc_id
}

resource "aws_lb_listener" "docker_listener" {
  load_balancer_arn = aws_lb.Docker-lb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.docker_tg.arn
  }
}

