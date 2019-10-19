
#lb
resource "aws_lb" "lb" {
  name               = "sample-lb"
  load_balancer_type = "application"
  internal           = false
  # idle_timeout               = 60
  # enable_deletion_protection = true

  security_groups = [
    "${aws_security_group.alb.id}",
  ]

  subnets = [
    "${data.terraform_remote_state.vpc.outputs.public_subnet_1_id}",
    "${data.terraform_remote_state.vpc.outputs.public_subnet_2_id}",
  ]
}

resource "aws_lb_target_group" "http" {
  name     = "sample-http"
  port     = 3000
  protocol = "HTTP"
  vpc_id   = "${data.terraform_remote_state.vpc.outputs.vpc_id}"

  health_check {
    interval            = 30
    path                = "/health_check"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 10
    healthy_threshold   = 3
    unhealthy_threshold = 3
  }
  depends_on = [aws_lb.lb]
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = "${aws_lb.lb.arn}"
  port              = "80"
  protocol          = "HTTP"

  default_action {
    target_group_arn = "${aws_lb_target_group.http.arn}"
    type             = "forward"
  }
}
