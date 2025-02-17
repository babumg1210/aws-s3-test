variable "bucket_name" {
  description = "The name of the bucket"
  type        = string
}

variable "acl" {
  description = "The ACL of the bucket"
  type        = string
  default     = "private"
}

variable "versioning" {
  description = "Enable versioning"
  type        = bool
  default     = true
}

variable "sse_algorithm" {
  description = "Server-side encryption algorithm"
  type        = string
  default     = "AES256"
}

variable "tags" {
  description = "A map of tags to assign to the bucket"
  type        = map(string)
  default     = {}
}

variable "bucket_policy" {
  description = "The bucket policy"
  type        = string
  default     = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = "*"
        Action = "s3:GetObject"
        Resource = "arn:aws:s3:::${var.bucket_name}/*"
        Condition = {
          IpAddress = {
            "aws:SourceIp" = "203.0.113.0/24"
          }
        }
      }
    ]
  })
}
