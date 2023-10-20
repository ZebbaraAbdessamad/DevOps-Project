resource "aws_route_table" "my_route_table" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my_gw.id
  }

  tags = {
    Name = "MyRouteTable"
  }
}

resource "aws_route_table_association" "my_subnet1_association" {
  subnet_id      = aws_subnet.subnet_public-1.id
  route_table_id = aws_route_table.my_route_table.id
}


resource "aws_route_table_association" "my_subnet2_association" {
  subnet_id      = aws_subnet.subnet_public-2.id
  route_table_id = aws_route_table.my_route_table.id
}