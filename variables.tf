variable "s3_bucket_name" {
  description = "Name for the S3 bucket (Must be globally unique)"
  type = string
}

variable "s3_bucket_access_value" {
  description = "Specify the Access Control List for the Bucket"
  type = string
  default = "private"
}

variable "s3_bucket_versioning_value" {
  description = "Enables S3 bucket Versioning(default: false)"
  type = bool
  default = false
}