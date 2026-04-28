resource "aws_instance" "main" {

  for_each = var.map

  ami           = each.value.ami
  instance_type = each.value.instance_type
  subnet_id     = element(aws_subnet.main[*].id, index(keys(var.map), each.key) % length(aws_subnet.main))


  tags = {
    Name = "${local.project}-instance-${each.key}"
  }

}
