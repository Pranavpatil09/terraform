resource "aws_vpc" "main" {
  cidr_block = var.VPC_CIDR_block
    tags = {
    Name = "${local.project}-vpc"
  }
}