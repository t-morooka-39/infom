terraform {
  backend "s3" {
    bucket = "terraform-container-infra"
    key    = "infom-rails/iam/terraform.tfstate"
    region = "us-east-1"
  }
}
provider "aws" {
  profile = "terraform-user"
  region  = "us-east-1"
}

#output
output "ecs_instance_profile_name" {
  value = "${aws_iam_instance_profile.ecs_instance_profile.name}"
}
output "ecs_task_role_arn" {
  value = "${aws_iam_role.ecs_task_role.arn}"
}
