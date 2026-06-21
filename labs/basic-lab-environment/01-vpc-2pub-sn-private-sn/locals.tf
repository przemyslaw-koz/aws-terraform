locals {
  default_tags = {
    Owner        = "PrzemyslawKozlowski"
    ManagedBy    = "Terraform"
    Project      = "aws-terraform-lab"
    Environment  = "lab"
    Lab          = "basic-lab-environment/01-vpc-2pub-sn-private-sn"
    Stack        = var.stack_name
    AutoShutdown = "true"
  }
}