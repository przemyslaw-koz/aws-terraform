resource "aws_security_group" "first_vpc" {
  name   = "${var.stack_name}-first-vpc-sg"
  vpc_id = aws_vpc.first_vpc.id
}

resource "aws_vpc_security_group_ingress_rule" "first_vpc" {
  security_group_id = aws_security_group.first_vpc.id
  ip_protocol       = "-1"
  cidr_ipv4         = aws_vpc.second_vpc.cidr_block
}

resource "aws_vpc_security_group_egress_rule" "first_vpc" {
  security_group_id = aws_security_group.first_vpc.id
  ip_protocol       = "-1"
  cidr_ipv4         = aws_vpc.second_vpc.cidr_block
}

resource "aws_security_group" "second_vpc" {
  name   = "${var.stack_name}-second-vpc-sg"
  vpc_id = aws_vpc.second_vpc.id
}

resource "aws_vpc_security_group_ingress_rule" "second_vpc" {
  security_group_id = aws_security_group.second_vpc.id
  ip_protocol       = "-1"
  cidr_ipv4         = aws_vpc.first_vpc.cidr_block
}

resource "aws_vpc_security_group_egress_rule" "second_vpc" {
  security_group_id = aws_security_group.second_vpc.id
  ip_protocol       = "-1"
  cidr_ipv4         = aws_vpc.first_vpc.cidr_block
}