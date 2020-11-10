terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 2.70"
    }
  }
}

provider "aws" {
  profile = "default"
  region = "us-east-1"
}

resource "aws_vpc" "my_new_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "my_new_vpc"
  }
}

