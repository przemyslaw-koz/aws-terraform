variable "stack_name" {
  description = "Stack name"
  type        = string
  default     = "terraform-lab"
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

variable "second_public_subnet" {
  description = "Optional second public subnet. When null, only one public subnet is created."
  type = object({
    cidr_block        = string
    availability_zone = string
  })
  default = null
}

variable "second_private_subnet" {
  description = "Optional second private subnet. When null, only one private subnet is created."
  type = object({
    cidr_block        = string
    availability_zone = string
  })
  default = null
}