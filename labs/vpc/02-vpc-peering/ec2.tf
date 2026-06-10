module "first_ec2" {
  source        = "../../../modules/ec2-ssm"
  instance_name = "${var.stack_name}-first-ec2"
  instance_type = "t3.micro"
  root_block_device = {
    volume_size           = 8
    volume_type           = "gp3"
    delete_on_termination = true
    encrypted             = false
  }
  common_tags        = var.common_tags
  subnet_id          = aws_subnet.first_vpc.id
  security_group_ids = [aws_security_group.first_vpc.id]
}

module "second_ec2" {
  source        = "../../../modules/ec2-ssm"
  instance_name = "${var.stack_name}-second-ec2"
  instance_type = "t3.micro"
  root_block_device = {
    volume_size           = 8
    volume_type           = "gp3"
    delete_on_termination = true
    encrypted             = false
  }
  common_tags        = var.common_tags
  subnet_id          = aws_subnet.second_vpc.id
  security_group_ids = [aws_security_group.second_vpc.id]
}