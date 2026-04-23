#route table association configuration

resource "aws_route_table_association" "public-subnet-association" {
    subnet_id = aws_subnet.public-subnet.id
    route_table_id = aws_route_table.public-route-table.id
}