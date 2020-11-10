variable "ec2_tags" {
    description = "Tags for my ec2 instance"
    type = map(string)
    default = {}
}