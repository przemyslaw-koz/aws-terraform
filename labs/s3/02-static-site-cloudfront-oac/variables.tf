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
  default = "terraform-lab-s3-01"
}

variable "bucket_name" {
  type = string
}