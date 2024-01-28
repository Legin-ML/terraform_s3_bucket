resource "aws_s3_bucket" "s3_bucket_mod" {
  bucket = var.bucket_name
}

resource "aws_s3_bucket_ownership_controls" "s3_bucket_mod_oc" {
  bucket = aws_s3_bucket.s3_bucket_mod.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_public_access_block" "s3_bucket_mod_pab" {
  bucket = aws_s3_bucket.s3_bucket_mod.id

  block_public_acls       = var.bucket_public_access ? false : true 
  block_public_policy     = var.bucket_public_access ? false : true
  ignore_public_acls      = var.bucket_public_access ? false : true
  restrict_public_buckets = var.bucket_public_access ? false : true
}

resource "aws_s3_bucket_acl" "s3_bucket_mod_acl" {
  depends_on = [
    aws_s3_bucket_ownership_controls.s3_bucket_mod_oc,
    aws_s3_bucket_public_access_block.s3_bucket_mod_pab,
  ]

  bucket = aws_s3_bucket.s3_bucket_mod.id
  acl    = var.bucket_public_access ? "public-read" : "private"
}

resource "aws_s3_bucket_versioning" "s3_bucket_mod_versioning" {
  bucket = aws_s3_bucket.s3_bucket_mod.id

  versioning_configuration {
    status = var.bucket_versioning ? "Enabled" : "Disabled"
  }
}
