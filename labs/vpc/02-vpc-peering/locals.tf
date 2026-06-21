locals {
  default_tags = {
    Owner        = "PrzemyslawKozlowski"
    ManagedBy    = "Terraform"
    Project      = "aws-terraform-lab"
    Environment  = "lab"
    Lab          = "vpc/02-vpc-peering"
    Stack        = var.stack_name
    AutoShutdown = "true"
  }
}