module "ec2-instance" {
source  = "terraform-aws-modules/ec2-instance/aws"
version = "6.4.0"

name = "EC2-instance"

  instance_type = "t3.micro"
  ami = "ami-0e12ffc2dd465f6e4"
  vpc_security_group_ids = [module.vpc.default_security_group_id]
  subnet_id     = module.vpc.public_subnets[0]

  tags = {
    name        = "module-project-ec2-instance"
  }

}