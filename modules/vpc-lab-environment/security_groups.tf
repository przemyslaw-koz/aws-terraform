resource "aws_security_group" "bastion" {
  name   = "${var.stack_name}-bastion-sg"
  vpc_id = module.network.vpc_id
}

resource "aws_vpc_security_group_ingress_rule" "bastion" {
  security_group_id = aws_security_group.bastion.id

  cidr_ipv4   = var.my_ip
  from_port   = 22
  to_port     = 22
  ip_protocol = "tcp"
}

resource "aws_vpc_security_group_egress_rule" "bastion" {
  security_group_id = aws_security_group.bastion.id

  cidr_ipv4   = "0.0.0.0/0"
  ip_protocol = "-1"
}

resource "aws_security_group" "private_server" {
  name   = "${var.stack_name}-private-server-sg"
  vpc_id = module.network.vpc_id
}

resource "aws_vpc_security_group_ingress_rule" "private_server" {
  security_group_id = aws_security_group.private_server.id

  referenced_security_group_id = aws_security_group.bastion.id
  from_port                    = 22
  to_port                      = 22
  ip_protocol                  = "tcp"
}

resource "aws_vpc_security_group_egress_rule" "private_server" {
  security_group_id = aws_security_group.private_server.id

  cidr_ipv4   = "0.0.0.0/0"
  ip_protocol = "-1"
}