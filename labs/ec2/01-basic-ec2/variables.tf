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

variable "instance_name" {
  type    = string
  default = "app-server"
}

variable "instance_type" {
  type    = string
  default = "t3.micro"
}

variable "root_block_device" {
  description = "Root block device config"

  type = object({
    volume_size = number
    volume_type = string
  })

  default = {
    volume_size = 8
    volume_type = "gp3"
  }
}

variable "common_tags" {
  type = map(string)

  default = {
    Owner     = "PrzemyslawKozlowski"
    ManagedBy = "Terraform"
  }
}
