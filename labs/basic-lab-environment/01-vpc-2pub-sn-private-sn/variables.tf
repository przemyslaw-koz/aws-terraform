variable "aws_region" {
  description = "AWS region used by Terraform"
  type        = string
  default     = "eu-north-1"
}

variable "aws_profile" {
  description = "AWS CLI profile used by Terraform"
  type        = string
  default     = "terraform-lab"
}

variable "stack_name" {
  type    = string
  default = "terraform-lab-vpc-endpoint"
}

variable "my_ip" {
  type        = string
  description = "My IP address"
}