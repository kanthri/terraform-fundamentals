terraform {
  backend "s3" {
    bucket = "edvins1-tf-state"
    key    = "main/terraform.tfstate"
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
resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "my_vpc"
  }
}
resource "aws_security_group" "my_group" {
  name   = "my_group"
  vpc_id = aws_vpc.my_vpc.id
}
resource "aws_subnet" "my_subnet" {
  cidr_block = "10.0.0.0/16"
  vpc_id     = aws_vpc.my_vpc.id
}
resource "aws_instance" "my_ec2_instance" {
  ami                    = "ami-c50e37be"
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.my_subnet.id
  vpc_security_group_ids = [aws_security_group.my_group.id]
  tags = {
    Name = local.ec2_name
  }
}