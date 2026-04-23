# Fix for CKV_AWS_130 - Subnet subnet-01b42d8b272a7fb7a auto-assigns public IP to instances on launch
#
# IMPORTANT: This block provides the corrected configuration for the AWS Subnet
# identified as 'subnet-01b42d8b272a7fb7a'.
#
# If an 'aws_subnet' resource already exists in your Terraform configuration
# that manages 'subnet-01b42d8b272a7fb7a', you must update that *existing*
# block with the `map_public_ip_on_launch = false` attribute.
# Do NOT create a new duplicate resource block unless you intend to replace
# the existing subnet after careful migration and deletion.
#
# Please replace the placeholder values for `vpc_id`, `cidr_block`, and
# `availability_zone` with the actual corresponding values for
# 'subnet-01b42d8b272a7fb7a' from your AWS environment.
resource "aws_subnet" "example_application_private_subnet" {
  # Replace with the actual VPC ID where 'subnet-01b42d8b272a7fb7a' resides.
  vpc_id                  = "vpc-0123456789abcdef0"

  # Replace with the actual CIDR block configured for 'subnet-01b42d8b272a7fb7a'.
  cidr_block              = "10.0.1.0/24"

  # Replace with the actual Availability Zone (e.g., "us-east-1a") for this subnet.
  availability_zone       = "us-east-1a"

  # SECURITY FIX: This attribute prevents new EC2 instances launched in this subnet
  # from automatically being assigned a public IP address.
  # Setting `map_public_ip_on_launch` to `false` is a critical security measure.
  # It ensures that instances are not directly exposed to the internet by default,
  # significantly reducing their attack surface and requiring explicit configuration
  # for public access (e.g., via an Elastic IP or Load Balancer).
  map_public_ip_on_launch = false

  # Best Practice: Apply consistent and descriptive tags for resource identification,
  # cost allocation, and operational management.
  tags = {
    Name        = "ApplicationPrivateSubnet"
    Environment = "Production"
    ManagedBy   = "Terraform"
    Purpose     = "Private_Backend_Instances"
  }
}