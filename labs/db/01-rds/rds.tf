resource "aws_db_instance" "rds" {
    engine = "mysql"
    instance_class = "db.t3.micro"
    allocated_storage = 5
    db_name = "mysqldb"
    username = "admin"
    password = random_password.rds.result
    skip_final_snapshot = true
    backup_retention_period = 0
    db_subnet_group_name = aws_db_subnet_group.rds.name
    vpc_security_group_ids = [aws_security_group.rds.id]
    tags = {
        Name = "${var.stack_name}-rds"
        Component = "rds"
    }
}

resource "aws_db_subnet_group" "rds" {
    name = "${var.stack_name}-rds-subnet-group"
    subnet_ids = module.networking.private_subnet_ids
    tags = {
        Name = "${var.stack_name}-rds-subnet-group"
        Component = "rds-subnet-group"
    }
}

resource "random_password" "rds" {
    length = 16 
    special = false
}