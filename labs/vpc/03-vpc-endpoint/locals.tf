locals {
  default_tags = {
    Owner        = "PrzemyslawKozlowski"
    ManagedBy    = "Terraform"
    Project      = "aws-terraform-lab"
    Environment  = "lab"
    Lab          = "vpc/03-vpc-endpoint"
    Stack        = var.stack_name
    AutoShutdown = "true"
  }
}