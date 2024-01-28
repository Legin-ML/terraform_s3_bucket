output "s3_bucket_id" {
    description = "ID of the Bucket."
    value = aws_s3_bucket.s3_bucket_mod.id
}

output "s3_bucket_arn" {
    description = "ARN of the Bucket (Format: arn:aws:s3:::bucketname)."
    value = aws_s3_bucket.s3_bucket_mod.arn
}

output "s3_bucket_domain_name" {
    description = "Domain name of the Bucket"
    value = aws_s3_bucket.s3_bucket_mod.bucket_domain_name
}