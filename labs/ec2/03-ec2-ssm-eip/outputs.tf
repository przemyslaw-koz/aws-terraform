output "instance_id" {
  value = aws_instance.app_server.id
}

output "eip_public_ip" {
  value = aws_eip.ec2_ssm_eip.public_ip
}