output "vpc_id" {
  value = module.network.vpc_id
}
output "public_subnet_id" {
  value = module.network.public_subnet_id
}
output "private_subnet_id" {
  value = module.network.private_subnet_id
}

output "public_subnet_2_id" {
  value = module.network.public_subnet_2_id
}

output "private_subnet_2_id" {
  value = module.network.private_subnet_2_id
}

output "public_subnet_ids" {
  value = module.network.public_subnet_ids
}

output "private_subnet_ids" {
  value = module.network.private_subnet_ids
}
output "bastion_instance_id" {
  value = module.bastion.instance_id
}
output "bastion_public_ip" {
  value = module.bastion.instance_public_ip
}
output "private_server_instance_id" {
  value = module.private_server.instance_id
}
output "private_server_private_ip" {
  value = module.private_server.instance_private_ip
}
output "private_route_table_id" {
  value = module.network.private_route_table_id
}
output "public_route_table_id" {
  value = module.network.public_route_table_id
}
output "bastion_security_group_id" {
  value = aws_security_group.bastion.id
}
output "private_server_security_group_id" {
  value = aws_security_group.private_server.id
}