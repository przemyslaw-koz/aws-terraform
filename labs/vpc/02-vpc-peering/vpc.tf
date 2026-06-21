resource "aws_vpc" "first_vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name      = "${var.stack_name}-first-vpc"
    Component = "first-vpc"
  }
}

resource "aws_vpc" "second_vpc" {
  cidr_block           = "10.1.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name      = "${var.stack_name}-second-vpc"
    Component = "second-vpc"
  }
}