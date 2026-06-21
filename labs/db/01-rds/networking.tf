module "networking" {
  source     = "../../../modules/vpc-lab-environment"
  stack_name = var.stack_name
  my_ip      = var.my_ip
  second_private_subnet = {
    cidr_block        = "10.0.3.0/24"
    availability_zone = "eu-north-1b"
  }
  second_public_subnet = {
    cidr_block        = "10.0.4.0/24"
    availability_zone = "eu-north-1b"
  }
}