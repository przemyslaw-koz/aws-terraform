module "public_bastion" {
  source        = "../../../modules/ec2-ssm"
  instance_name = "${var.stack_name}-public-bastion"
  instance_type = "t3.micro"
  root_block_device = {
    volume_size           = 8
    volume_type           = "gp3"
    delete_on_termination = true
    encrypted             = false
  }
  common_tags                 = var.common_tags
  associate_public_ip_address = true
  subnet_id                   = aws_subnet.public.id
  security_group_ids          = [aws_security_group.public.id]
}

module "private_server" {
  source        = "../../../modules/ec2-ssm"
  instance_name = "${var.stack_name}-private-server"
  instance_type = "t3.micro"
  root_block_device = {
    volume_size           = 8
    volume_type           = "gp3"
    delete_on_termination = true
    encrypted             = false
  }
  common_tags        = var.common_tags
  subnet_id          = aws_subnet.private.id
  security_group_ids = [aws_security_group.private.id]
}