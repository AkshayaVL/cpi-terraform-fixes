# Fix for CKV_AWS_130 - Subnet subnet-079bd3fd7ff78126f auto-assigns public IP to instances on launch
resource "aws_subnet" "subnet-079bd3fd7ff78126f" {
  # IMPORTANT: Replace these placeholder values with the actual configuration
  # of the existing subnet "subnet-079bd3fd7ff78126f".
  # If this subnet is already managed by Terraform, ensure these attributes match
  # its current definition in your state file.
  vpc_id                  = "vpc-xxxxxxxxxxxxxxxxx" # Replace with the actual VPC ID
  cidr_block              = "10.0.1.0/24"           # Replace with the actual CIDR block
  availability_zone       = "us-east-1a"            # Replace with the actual availability zone

  # SECURITY FIX: Set `map_public_ip_on_launch` to `false` to prevent EC2 instances
  # launched in this subnet from automatically receiving a public IP address.
  # This reduces the default attack surface and ensures instances are not directly
  # internet-reachable unless explicitly configured to be so (e.g., via Elastic IP
  # or through a public subnet's NAT Gateway for outbound access).
  map_public_ip_on_launch = false

  # Add any other existing attributes like tags, IPv6 CIDR blocks, etc.,
  # from the original subnet definition to prevent unwanted changes.
  tags = {
    Name        = "my-app-private-subnet"
    Environment = "production"
    # ... other existing tags
  }
}