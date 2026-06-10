resource "aws_route_table" "first_vpc" {
  vpc_id = aws_vpc.first_vpc.id
  route {
    cidr_block                = aws_vpc.second_vpc.cidr_block
    vpc_peering_connection_id = aws_vpc_peering_connection.first_vpc_second_vpc.id
  }

  tags = merge(var.common_tags, {
    Name = "${var.stack_name}-first-vpc-rt"
  })
}

resource "aws_route_table" "second_vpc" {
  vpc_id = aws_vpc.second_vpc.id
  route {
    cidr_block                = aws_vpc.first_vpc.cidr_block
    vpc_peering_connection_id = aws_vpc_peering_connection.first_vpc_second_vpc.id
  }

  tags = merge(var.common_tags, {
    Name = "${var.stack_name}-second-vpc-rt"
  })
}

resource "aws_route_table_association" "first_vpc" {
  subnet_id      = aws_subnet.first_vpc.id
  route_table_id = aws_route_table.first_vpc.id
}

resource "aws_route_table_association" "second_vpc" {
  subnet_id      = aws_subnet.second_vpc.id
  route_table_id = aws_route_table.second_vpc.id
}