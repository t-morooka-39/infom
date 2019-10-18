resource "aws_security_group" "instance" {
  name        = "instance"
  description = "instance sg"
  vpc_id      = "${data.terraform_remote_state.vpc.outputs.vpc_id}"
  tags = {
    Name = "rails_i_sg"
  }

  ingress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"

    security_groups = [
      "${aws_security_group.alb.id}",
    ]
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
resource "aws_security_group" "alb" {
  name        = "sample-rails-alb"
  description = "http and https"
  vpc_id      = "${data.terraform_remote_state.vpc.outputs.vpc_id}"

  tags = {
    Name = "rails_alb_sg"
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


