#public subnet configuration

resource "aws_subnet" "public-subnet" {
    vpc_id            = aws_vpc.my-vpc.id
    cidr_block        = "10.0.1.0/24"      
    tags = {
        Name = "public-subnet"
    }
}

#private subnet configuration

resource "aws_subnet" "private-subnet" {
    vpc_id            = aws_vpc.my-vpc.id
    cidr_block        = "10.0.2.0/24"      
    tags = {
        Name = "private-subnet"
    }
}