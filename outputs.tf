output "bucket_id" {
  description = "The name of the bucket"
  value       = module.my_s3_bucket.bucket_id
}

output "bucket_arn" {
  description = "The ARN of the bucket"
  value       = module.my_s3_bucket.bucket_arn
}
