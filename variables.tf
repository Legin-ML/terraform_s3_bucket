variable "bucket_name" {
  description = "Name for the S3 bucket (Must be globally unique)"
  type = string
}

variable "bucket_public_access" {
  description = "Should the Bucket be public? <true/false>   [default: false]"
  type = bool
  default = false
}

variable "bucket_versioning" {
  description = "Should S3 bucket versioning be enabled? <true/false>  [default: false]"
  type = bool
  default = false
}