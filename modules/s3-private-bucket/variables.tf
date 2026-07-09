variable "bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
}

variable "versioning_enabled" {
  description = "Enable or disable versioning for the S3 bucket"
  type        = bool
  default     = true
}

variable "lifecycle_enabled" {
  description = "Enable or disable lifecycle for the S3 bucket"
  type        = bool
  default     = true
}

variable "transition_days" {
  description = "The number of days before transitioning objects to STANDARD_IA"
  type        = number
  default     = 30
}

variable "expiration_days" {
  description = "The number of days before permanently deleting current object versions"
  type        = number
  default     = 30
}

variable "noncurrent_version_expiration_days" {
  description = "The number of days before permanently deleting noncurrent object versions"
  type        = number
  default     = 5
}
