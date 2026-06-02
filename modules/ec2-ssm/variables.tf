variable "instance_name" {
  description = "Instance name"
  type    = string
  default = "app-server"
}

variable "instance_type" {
  description = "Instance type"
  type    = string
  default = "t3.micro"
}

variable "user_data" {
  description = "User data to pass to the instance"
  type    = string
  default = ""
}

variable "root_block_device" {
  description = "Root block device config"

  type = object({
    volume_size = number
    volume_type = string
    encrypted   = bool
    delete_on_termination = bool
  })

  default = {
    volume_size = 8
    volume_type = "gp3"
    encrypted   = true
    delete_on_termination = true
  }
}

variable "common_tags" {
  description = "Common tags to be applied to all resources"
  type = map(string)  

  default = {
    Owner     = "PrzemyslawKozlowski"
    ManagedBy = "Terraform"
  }
}

variable "associate_public_ip_address" {
  description = "Associate public IP address to the instance"
  type    = bool
  default = true
}

variable "ami_ssm_parameter_name" {
  description = "AMI SSM parameter name pointing to the AMI image to use"
  type    = string
  default = "/aws/service/ami-amazon-linux-latest/al2023-ami-kernel-default-x86_64"
}
