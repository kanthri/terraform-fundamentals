output "id" {
    description = "EC2 instances ID"
    value = aws_instance.my_new_ec2_instance.id
}