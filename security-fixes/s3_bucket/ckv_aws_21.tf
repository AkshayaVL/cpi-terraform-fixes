# Fix for S3 bucket versioning not enabled
resource "aws_s3_bucket" "cpi-demo-akshaya-2026" {
  # Specify the bucket name to ensure it matches the existing resource
  bucket = "cpi-demo-akshaya-2026"
  
  # Enable versioning to store multiple versions of an object
  versioning {
    # Enable versioning to allow for recovery from unintended changes or deletions
    enabled = true 
  }
  
  # Enable server-side encryption by default to protect data at rest
  server_side_encryption_configuration {
    # Use AES256 as the default encryption algorithm
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}