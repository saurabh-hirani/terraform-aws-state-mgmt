variable "state_bucket_name" {
  description = "Terraform state bucket name"
}

variable "versioning_config" {
  description = "AWS S3 versioning config"
  type = object({
    enabled = bool
  })
  default = null
}

variable "create_log_bucket" {
  description = "Boolean to decide whether to create log bucket or reuse existing one"
  default     = true
}

variable "logging_config" {
  description = "AWS S3 state bucket logging config"
  type = object({
    target_bucket = string
    target_prefix = string
  })

  default = null
}

variable "force_destroy" {
  description = "Boolean flag to prevent force destroy of state buckets"
  default     = false
}

variable "lock_table_name" {
  description = "AWS Lock table name"
  default     = ""
}

variable "lock_table_read_capacity" {
  description = "AWS Lock table read capacity"
  default     = 1
}

variable "lock_table_write_capacity" {
  description = "AWS Lock table write capacity"
  default     = 1
}

variable "lock_table_hash_key" {
  description = "AWS Lock table hash key"
  default     = "LockID"
}

variable "tags" {
  type        = map(string)
  description = "Tags"
  default     = {}
}
