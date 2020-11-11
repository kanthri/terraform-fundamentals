terraform {
  backend "s3" {
    bucket = "edvins1-tf-state"
    key    = "vpc/terraform.tfstate"
    region = "us-east-1"

    dynamodb_table = "state-locker"
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
resource "aws_vpc" "vpc_remote_data_source_example" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "vpc_remote_data_source_example"
  }
}
output "vpc_id" {
  value = aws_vpc.vpc_remote_data_source_example.id
}