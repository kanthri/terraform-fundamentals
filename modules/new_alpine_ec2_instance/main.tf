resource "aws_vpc" "my_new_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "my_new_vpc"
  }
}

resource "aws_security_group" "my_new_group" {
  name   = "my_new_group"
  vpc_id = aws_vpc.my_new_vpc.id

  tags = {
    Name = "my_new_group"
  }
}

resource "aws_subnet" "my_new_subnet" {
  vpc_id     = aws_vpc.my_new_vpc.id
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "my_new_subnet"
  }
}

resource "aws_instance" "my_new_ec2_instance" {
  ami                    = "ami-0947d2ba12ee1ff75"
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.my_new_subnet.id
  vpc_security_group_ids = [aws_security_group.my_new_group.id]

  tags = var.ec2_tags
}

