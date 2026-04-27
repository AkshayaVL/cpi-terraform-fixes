# Fix for S3 bucket public access not fully blocked
resource "aws_s3_bucket_public_access_block" "cpi-demo-akshaya-2026" {
  # Enable the S3 bucket public access block to prevent public access
  bucket = aws_s3_bucket.cpi-demo-akshaya-2026.id
  # Block all public access to the bucket
  block_public_acls   = true
  # Block public access to the bucket and its objects
  block_public_policy = true
  # Ignore public ACLs on the bucket and its objects
  ignore_public_acls  = true
  # Restrict public access to the bucket and its objects
  restrict_public_buckets = true
}