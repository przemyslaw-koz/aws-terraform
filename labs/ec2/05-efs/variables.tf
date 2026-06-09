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

variable "common_tags" {
  type = map(string)

  default = {
    Owner     = "PrzemyslawKozlowski"
    ManagedBy = "Terraform"
  }
}

variable "creation_token" {
  type    = string
  default = "efs-file-system"
}

variable "name" {
  type    = string
  default = "efs-file-system"
}

variable "lifecycle_policy" {
  type = object({
    transition_to_ia      = string
    transition_to_archive = string
  })
  default = {
    transition_to_ia      = "AFTER_7_DAYS"
    transition_to_archive = "AFTER_30_DAYS"
  }
}