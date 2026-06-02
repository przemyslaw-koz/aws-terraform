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

variable "availability_zone" {
  type    = string
  default = "eu-north-1a"
}

variable "size" {
  type    = number
  default = 1
}

variable "volume_type" {
  type    = string
  default = "gp3"
}

variable "common_tags" {
  type = map(string)

  default = {
    Owner     = "PrzemyslawKozlowski"
    ManagedBy = "Terraform"
  }
}