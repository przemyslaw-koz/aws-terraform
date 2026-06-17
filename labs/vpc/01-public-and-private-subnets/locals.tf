locals {
  default_tags = {
    Owner        = "PrzemyslawKozlowski"
    ManagedBy    = "Terraform"
    Project      = "aws-terraform-lab"
    Environment  = "lab"
    Service      = "vpc"
    Lab          = "vpc/01-public-and-private-subnets"
    Stack        = var.stack_name
    AutoShutdown = "true"
  }
}