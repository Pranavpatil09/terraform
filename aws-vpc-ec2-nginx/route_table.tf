#Route table configuration

resource "aws_route_table" "my-route-table" {
  vpc_id = aws_vpc.my-vpc.id

route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my-igw.id
  }

    tags = {
        Name = "webapp-route-table"
    }
}