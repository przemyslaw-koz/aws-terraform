output "public_bastion_id" {
  value = module.public_bastion.instance_id
}

output "public_bastion_public_ip" {
  value = module.public_bastion.instance_public_ip
}

output "private_server_id" {
  value = module.private_server.instance_id
}

output "private_server_private_ip" {
  value = module.private_server.instance_private_ip
}