instance_type = "t3.micro"

ec2_config = {
    volume_size = 30
    volume_type = "gp2"
}

additional_tags = {
    DEPT = "QA"
    PROJECT = "MYPROJECT_QA"
}