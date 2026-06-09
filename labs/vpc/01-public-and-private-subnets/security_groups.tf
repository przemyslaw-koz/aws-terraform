resource "aws_security_group" "public" {
  name   = "${var.stack_name}-public-sg"
  vpc_id = aws_vpc.main.id
}

resource "aws_vpc_security_group_ingress_rule" "public" {
  security_group_id = aws_security_group.public.id

  cidr_ipv4   = var.my_ip
  from_port   = 22
  to_port     = 22
  ip_protocol = "tcp"
}
resource "aws_vpc_security_group_egress_rule" "public" {
  security_group_id = aws_security_group.public.id

  cidr_ipv4   = "0.0.0.0/0"
  ip_protocol = "-1"
}

resource "aws_security_group" "private" {
  name   = "${var.stack_name}-private-sg"
  vpc_id = aws_vpc.main.id
}

resource "aws_vpc_security_group_ingress_rule" "private" {
  security_group_id = aws_security_group.private.id

  referenced_security_group_id   = aws_security_group.public.id
  from_port   = 22
  to_port     = 22
  ip_protocol = "tcp"
}

resource "aws_vpc_security_group_egress_rule" "private" {
  security_group_id = aws_security_group.private.id

  cidr_ipv4   = "0.0.0.0/0"
  ip_protocol = "-1"
}