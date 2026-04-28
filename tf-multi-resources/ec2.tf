resource "aws_instance" "main" {
  ami           = var.ec2_config[count.index].AMI_ID
  instance_type = var.ec2_config[count.index].INSTANCE_TYPE
  subnet_id     = element(aws_subnet.main[*].id, count.index % length(aws_subnet.main))
  # 0%2 = 0
  # 1%2 = 1
  # 2%2 = 0
  # 3%2 = 1

  count = 2

  tags = {
    Name = "${local.project}-instance-${count.index}"
  }

}
