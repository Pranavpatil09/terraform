terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.42.0"
    }
  }
}

provider "aws" {
  region = var.region
}

locals {
  owner = "abc"
  name = "MyWebServer"
}

resource "aws_instance" "mywebserver" {
  ami           = "ami-0c2b8ca1dad447f8"
  instance_type = "t2.micro"

  root_block_device {
    delete_on_termination = true
    volume_size = var.ec2_config.volume_size
    volume_type = var.ec2_config.volume_type
  }

  tags = merge(var.additional_tags, {
    Name = local.name
  })
}