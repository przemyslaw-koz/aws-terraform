output "vpc_id" {
  value = module.networking.vpc_id
}

output "public_subnet_id" {
  value = module.networking.public_subnet_id
}

output "private_subnet_id" {
  value = module.networking.private_subnet_id
}

output "bastion_instance_id" {
  value = module.networking.bastion_instance_id
}

output "bastion_public_ip" {
  value = module.networking.bastion_public_ip
}

output "private_server_instance_id" {
  value = module.networking.private_server_instance_id
}

output "private_server_private_ip" {
  value = module.networking.private_server_private_ip
}
