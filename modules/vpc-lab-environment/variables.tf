variable "stack_name" {
  description = "Stack name"
  type        = string
  default     = "terraform-lab"
}

variable "my_ip" {
  description = "My IP address"
  type        = string
  default     = "0.0.0.0/0"
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
