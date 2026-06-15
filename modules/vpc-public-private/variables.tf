variable "stack_name" {
  description = "Stack name"
  type        = string
  default     = "terraform-lab"
}

variable "common_tags" {
  description = "Common tags to be applied to all resources"
  type        = map(string)

  default = {
    Owner     = "PrzemyslawKozlowski"
    ManagedBy = "Terraform"
  }
}

variable "vpc_cidr_block" {
  description = "VPC CIDR block"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr_block" {
  description = "Public subnet CIDR block"
  type        = string
  default     = "10.0.1.0/24"
}

variable "private_subnet_cidr_block" {
  description = "Private subnet CIDR block"
  type        = string
  default     = "10.0.2.0/24"
}

variable "public_subnet_availability_zone" {
  description = "Public subnet availability zone"
  type        = string
  default     = "eu-north-1a"
}

variable "private_subnet_availability_zone" {
  description = "Private subnet availability zone"
  type        = string
  default     = "eu-north-1a"
}