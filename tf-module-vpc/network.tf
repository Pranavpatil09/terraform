provider "aws" {
  region = "ap-south-1"
}

data "aws_availability_zones" "name" {
  state = "available"
}


module "vpc" {
source  = "terraform-aws-modules/vpc/aws"
version = "6.6.1"

name = "my-vpc"
cidr = "10.0.0.0/16"

azs             = data.aws_availability_zones.name.names
public_subnets  = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
private_subnets = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]     

enable_nat_gateway = true           
enable_vpn_gateway = true

tags = {
  name        = "module-project-vpc"
  Environment = "dev"
}
}
