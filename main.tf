terraform {
  backend "s3" {
    bucket = "param2-tf-state"
    key    = "new_states/new_terraform.tfstate"
    region = "us-east-1"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 2.70"
    }
  }
}

provider "aws" {
  profile = "default"
  region  = "us-east-1"
}

module "my_new_alpine_ec2_instance" {
  source = "git::https://github.com/kanthri/terraform-modules.git"

  ec2_tags = {
    Name = "my_new_alpine_ec2_instance"
  }
}