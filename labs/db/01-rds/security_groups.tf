resource "aws_security_group" "rds" {
    name = "${var.stack_name}-rds-sg"
    vpc_id = module.networking.vpc_id
    tags = {
        Name = "${var.stack_name}-rds-sg"
        Component = "rds-sg"
    }
}

resource "aws_vpc_security_group_ingress_rule" "rds" {
  security_group_id = aws_security_group.rds.id

  referenced_security_group_id = module.networking.bastion_security_group_id
  from_port   = 3306
  to_port     = 3306
  ip_protocol = "tcp"
}
