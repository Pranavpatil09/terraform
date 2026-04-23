#route table association configuration

resource "aws_route_table_association" "my-route-table-association" {
  subnet_id = aws_subnet.public-subnet.id
  route_table_id = aws_route_table.my-route-table.id
}