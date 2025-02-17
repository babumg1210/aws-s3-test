provider "aws" {
  region = "us-east-1"
}

module "my_s3_bucket" {
  source         = "./modules/s3_bucket"
  bucket_name    = "my-unique-bucket-name"
  acl            = "private"
  versioning     = true
  sse_algorithm  = "AES256"
  tags = {
    Name        = "MyS3Bucket"
    Environment = "Dev"
  }
  bucket_policy  = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = "*"
        Action = "s3:GetObject"
        Resource = "arn:aws:s3:::my-unique-bucket-name/*"
        Condition = {
          IpAddress = {
            "aws:SourceIp" = "203.0.113.0/24"
          }
        }
      }
    ]
  })
}
