terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.41.0"
    }
  }
}

provider "aws" {
  region = var.region
}

resource "aws_instance" "mywebserver" {
  ami           = var.ami
  instance_type = var.instance_type

  tags = {
    Name = "webserverinstance"
  }
}