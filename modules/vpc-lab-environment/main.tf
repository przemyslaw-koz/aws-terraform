module "network" {
  source                           = "../vpc-public-private"
  stack_name                       = var.stack_name
  common_tags                      = var.common_tags
  vpc_cidr_block                   = "10.0.0.0/16"
  public_subnet_cidr_block         = "10.0.1.0/24"
  private_subnet_cidr_block        = "10.0.2.0/24"
  public_subnet_availability_zone  = "eu-north-1a"
  private_subnet_availability_zone = "eu-north-1a"
}