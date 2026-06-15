variable "stack_name" {
  description = "Stack name"
  type        = string
  default     = "terraform-lab"
}

variable "common_tags" {
  description = "Common tags"
  type        = map(string)
  default = {
    Owner     = "PrzemyslawKozlowski"
    ManagedBy = "Terraform"
  }
}

variable "my_ip" {
  description = "My IP address"
  type        = string
  default     = "0.0.0.0/0"
}