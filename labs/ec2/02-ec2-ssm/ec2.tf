data "aws_ssm_parameter" "amazon_linux_2023" {
  name = "/aws/service/ami-amazon-linux-latest/al2023-ami-kernel-default-x86_64"
}

resource "aws_instance" "app_server" {
  ami                         = data.aws_ssm_parameter.amazon_linux_2023.value
  instance_type               = var.instance_type
  iam_instance_profile        = aws_iam_instance_profile.ec2_ssm_profile.name
  associate_public_ip_address = true

  root_block_device {
    volume_size = var.root_block_device.volume_size
    volume_type = var.root_block_device.volume_type
  }

  tags = merge(
    var.common_tags,
    {
      Name = var.instance_name
  })
}