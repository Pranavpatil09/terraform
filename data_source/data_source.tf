data "aws_ami" "name" {
  most_recent = true
  owners = ["amazon"]
}

output "aws_ami" {
description = "This will print the AMI ID"
value = data.aws_ami.name.id
}

#secuirty group

data "aws_security_group" "name" {
  tags = {
    mywebserver = "http"
  }
}

output "aws_security_group" {
description = "This will print the security group ID"
value = data.aws_security_group.name.id
}

#VPC

data "aws_vpc" "name" {
  tags = {
    default = "default"
  }
}

output "aws_vpc" {
description = "This will print the VPC ID"
value = data.aws_vpc.name.id
}
