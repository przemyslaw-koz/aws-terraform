output "first_ec2_id" {
  value = module.first_ec2.instance_id
}

output "first_ec2_private_ip" {
  value = module.first_ec2.instance_private_ip
}

output "second_ec2_id" {
  value = module.second_ec2.instance_id
}

output "second_ec2_private_ip" {
  value = module.second_ec2.instance_private_ip
}

output "vpc_peering_connection_id" {
  value = aws_vpc_peering_connection.first_vpc_second_vpc.id
}