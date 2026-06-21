output "rds_instance_id" {
    value = aws_db_instance.rds.id
}
output "rds_instance_endpoint" {
    value = aws_db_instance.rds.endpoint
}
output "rds_instance_port" {
    value = aws_db_instance.rds.port
}
output "rds_instance_username" {
    value = aws_db_instance.rds.username
}
output "rds_instance_password" {
    value     = random_password.rds.result
    sensitive = true
}
output "rds_instance_db_name" {
    value = aws_db_instance.rds.db_name
}