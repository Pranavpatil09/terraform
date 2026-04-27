#variable for region 

variable "region" {
  description = "This will be the region"
  default = "ap-south-1"
}

#variable for instance type

variable "instance_type" {
  description = "What type of instance you want to create ?"
  type = string

  validation {
    condition = var.aws_instance_type=="t3.micro" || var.aws_instance_type=="t2.micro"
    error_message = "Instance type should be either t3.micro or t2.micro"
  }

}

#variable for ec2_configuration

variable "ec2_config" {
  description = "This will be the configuration for EC2 instance"
  type = object({
    volume_size = number
    volume_type = string
  })

  default = {
    volume_size = 20
    volume_type = "gp2"
  }
}

variable "additional_tags" {
  type = map(string)
  default = {}
}