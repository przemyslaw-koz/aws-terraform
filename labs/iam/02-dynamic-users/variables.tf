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

variable "iam_users" {
  description = "List of IAM users managed by terraform"
  type = map(object({
    groups = list(string)
    tags   = optional(map(string), {})
  }))
  default = {}
}
