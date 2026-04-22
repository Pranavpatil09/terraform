variable "region" {
  description = "This is the AWS region"
  default = "ap-south-1"
}

variable "instance_type" {
  description = "This is the instance type for the EC2 instance"
  default = "t3.micro"
}

variable "ami" {
  description = "This will be the AMI for the EC2 instance"
  default = "ami-0e12ffc2dd465f6e4"
}