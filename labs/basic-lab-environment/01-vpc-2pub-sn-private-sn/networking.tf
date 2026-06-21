module "networking" {
  source     = "../../../modules/vpc-lab-environment"
  stack_name = var.stack_name
  my_ip      = var.my_ip
}