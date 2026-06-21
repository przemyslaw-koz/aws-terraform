data "aws_ssm_parameter" "amazon_linux_2023" {
  name = var.ami_ssm_parameter_name
}

locals {
  component_tags = var.component != null ? { Component = var.component } : {}
}

resource "aws_iam_role" "ec2_ssm_role" {
  name = "${var.instance_name}-ssm-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = "sts:AssumeRole"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
  tags = merge({
    Name = "${var.instance_name}-ssm-role"
  }, local.component_tags)
}

resource "aws_iam_role_policy_attachment" "ec2_ssm_managed_instance" {
  role       = aws_iam_role.ec2_ssm_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

resource "aws_iam_instance_profile" "ec2_ssm_profile" {
  name = "${var.instance_name}-ssm-profile"
  role = aws_iam_role.ec2_ssm_role.name

  tags = merge({
    Name = "${var.instance_name}-ssm-profile"
  }, local.component_tags)
}

resource "aws_instance" "app_server" {
  ami                         = data.aws_ssm_parameter.amazon_linux_2023.value
  instance_type               = var.instance_type
  iam_instance_profile        = aws_iam_instance_profile.ec2_ssm_profile.name
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = length(var.security_group_ids) > 0 ? var.security_group_ids : null
  associate_public_ip_address = var.associate_public_ip_address
  user_data                   = var.user_data

  root_block_device {
    volume_size           = var.root_block_device.volume_size
    volume_type           = var.root_block_device.volume_type
    encrypted             = var.root_block_device.encrypted
    delete_on_termination = var.root_block_device.delete_on_termination
    tags = merge({
      Name = "${var.instance_name}-root-volume"
    }, local.component_tags)
  }

  tags = merge({
    Name = var.instance_name
  }, local.component_tags)
}

