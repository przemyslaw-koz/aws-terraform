module "networking" {
  source      = "../../../modules/vpc-lab-environment"
  stack_name  = var.stack_name
  common_tags = var.common_tags
  my_ip       = var.my_ip
}