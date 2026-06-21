module "network" {
  source                           = "../vpc-public-private"
  stack_name                       = var.stack_name
  vpc_cidr_block                   = "10.0.0.0/16"
  public_subnet_cidr_block         = "10.0.1.0/24"
  private_subnet_cidr_block        = "10.0.2.0/24"
  public_subnet_availability_zone  = "eu-north-1a"
  private_subnet_availability_zone = "eu-north-1a"
  second_public_subnet             = var.second_public_subnet
  second_private_subnet            = var.second_private_subnet
}