resource "aws_subnet" "main" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.${count.index}.0/24"
  count = 2

tags = {
    Name = "${local.project}-subnet-${count.index}"
  }
}