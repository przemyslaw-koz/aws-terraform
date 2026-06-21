locals {
  default_tags = {
    Owner        = "PrzemyslawKozlowski"
    ManagedBy    = "Terraform"
    Project      = "aws-terraform-lab"
    Environment  = "lab"
    Lab          = "db/01-rds"
    Stack        = var.stack_name
    AutoShutdown = "true"
  }
}