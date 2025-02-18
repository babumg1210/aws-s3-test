## Step 1 : Create an S3 Bucket
resource "random_id" "random_hex" {
  byte_length = 8
}

resource "aws_s3_bucket" "test_bucket" {
  bucket = format("%s-%s", var.bucket_name, random_id.random_hex.hex)
  acl    = var.acl
  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}







resource "aws_s3_bucket" "this" {
  bucket = var.bucket_name
  acl    = var.acl

  versioning {
    enabled = var.versioning
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = var.sse_algorithm
      }
    }
  }

  tags = var.tags
}

resource "aws_s3_bucket_policy" "this" {
  bucket = aws_s3_bucket.this.id

  policy = var.bucket_policy
}
