#output configuration to show the public IP and public URL of the EC2 instance

output "instance_public_ip" {
  value = aws_instance.nginxserver.public_ip
}

output "instance_public_url" {
  value = "http://${aws_instance.nginxserver.public_ip}"
}