resource "aws_instance" "sample" {
  ami                         = "ami-084f07d75acedcefa"
  instance_type               = "t2.small"
  monitoring                  = true
  iam_instance_profile        = "${data.terraform_remote_state.aws_iam.outputs.ecs_instance_profile_name}"
  subnet_id                   = "${data.terraform_remote_state.vpc.outputs.public_subnet_1_id}"
  user_data                   = "${file("./user_data.sh")}"
  associate_public_ip_address = true
  key_name                    = "${aws_key_pair.auth.id}"

  vpc_security_group_ids = [
    "${aws_security_group.instance.id}",
  ]

  root_block_device {
    volume_size = "30"
    volume_type = "gp2"
  }
  tags = {
    Name = "rails_instance"
  }
}
variable "key_name" {}
variable "public_key_path" {}

resource "aws_key_pair" "auth" {
  key_name   = "${var.key_name}"
  public_key = "${file(var.public_key_path)}"
}
