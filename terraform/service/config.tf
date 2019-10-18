terraform {
  backend "s3" {
    bucket = "terraform-container-infra"
    key    = "infom-rails/service/terraform.tfstate"
    region = "us-east-1"
  }
}
provider "aws" {
  profile = "terraform-user"
  region  = "us-east-1"
}

#remote_state
data "terraform_remote_state" "aws_iam" {
  backend = "s3"
  config = {
    bucket = "terraform-container-infra"
    key    = "infom-rails/iam/terraform.tfstate"
    region = "us-east-1"
  }
}

data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "terraform-container-infra"
    key    = "infom-rails/vpc/terraform.tfstate"
    region = "us-east-1"
  }
}
