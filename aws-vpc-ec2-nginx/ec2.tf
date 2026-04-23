#EC2 instance configuration for nginx web server

resource "aws_instance" "nginxserver" {
  ami = "ami-0e12ffc2dd465f6e4" # Amazon Linux 2 AMI (HVM), SSD Volume Type
  instance_type = "t3.micro"
  subnet_id = aws_subnet.public-subnet.id
  vpc_security_group_ids = [aws_security_group.mysg.id]
  user_data = <<-EOF
              #!/bin/bash
              sudo yum update -y
              sudo yum install nginx -y
              sudo systemctl start nginx
              sudo systemctl enable nginx
              EOF
  tags = {
    Name = "nginxserver"
  }
}