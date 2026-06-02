output "instance_id" {
  value = aws_instance.app_server.id
}

output "instance_public_ip" {
  value = aws_instance.app_server.public_ip
}

output "instance_private_ip" {
  value = aws_instance.app_server.private_ip
}

output "iam_role_name" {
  value = aws_iam_role.ec2_ssm_role.name
}

output "iam_instance_profile_name" {
  value = aws_iam_instance_profile.ec2_ssm_profile.name
}

output "instance_arn" {
  value = aws_instance.app_server.arn
}

output "availability_zone" {
  value = aws_instance.app_server.availability_zone
}

output "private_ip" {
  value = aws_instance.app_server.private_ip
}

output "public_ip" {
  value = aws_instance.app_server.public_ip
}
