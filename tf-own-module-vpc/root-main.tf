provider "aws" {
  region = "ap-south-1"
}

module "vpc" {
  source = "./module/vpc"
  vpc_config = {
    CIDR_block = "10.0.0.0/16"
    Name = "MyVPC"
  }

    subnet_config = {
        public_subnet = {
          CIDR_block = "10.0.1.0/24"
          az         = "ap-south-1a"
          public     = true
        }
        private_subnet = {
          CIDR_block = "10.0.2.0/24"
          az         = "ap-south-1b" 
        }
    }
}