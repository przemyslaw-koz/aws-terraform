module "bastion" {
  source             = "../ec2-ssm"
  component          = "bastion"
  instance_name      = "${var.stack_name}-bastion"
  instance_type      = "t3.micro"
  subnet_id          = module.network.public_subnet_id
  security_group_ids = [aws_security_group.bastion.id]
}

module "private_server" {
  source                      = "../ec2-ssm"
  component                   = "private-server"
  instance_name               = "${var.stack_name}-private-server"
  instance_type               = "t3.micro"
  associate_public_ip_address = false
  subnet_id                   = module.network.private_subnet_id
  security_group_ids          = [aws_security_group.private_server.id]
}