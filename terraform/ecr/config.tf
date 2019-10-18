terraform {
  backend "s3" {
    bucket = "terraform-container-infra"
    key    = "infom-rails/ecr/terraform.tfstate"
    region = "us-east-1"
  }
}
provider "aws" {
  profile = "terraform-user"
  region  = "us-east-1"
}
