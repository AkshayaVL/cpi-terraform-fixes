# Fix for CKV_AWS_SUB_TAG - Subnet subnet-05bc1a6b041b9f1fc has no Name tag — hard to identify public vs private
resource "aws_subnet" "subnet-05bc1a6b041b9f1fc" {
  # This fixes the missing 'Name' tag, which is crucial for quick identification
  # and differentiating between public/private subnets, aligning with security
  # best practices for resource management and operational clarity.
  tags = {
    # Assign a descriptive Name tag. Replace "AppPrivateSubnet" with a name that
    # accurately reflects the subnet's intended purpose (e.g., "WebPublicSubnet",
    # "DBPrivateSubnet", "ToolsManagementSubnet"). This enhances observability
    # and reduces human error during incident response or configuration changes.
    "Name" = "AppPrivateSubnet"
    # AWS Best Practice: Include an 'Environment' tag for better resource organization
    # and to support environment-specific security policies and access controls.
    "Environment" = "Production"
    # AWS Best Practice: Identify the tool or process managing this resource.
    # This aids in auditability and change management for security compliance.
    "ManagedBy" = "Terraform"
  }

  # IMPORTANT: The following attributes (vpc_id, cidr_block, availability_zone,
  # and map_public_ip_on_launch) are placeholders. They MUST be configured
  # to match the exact existing configuration of the subnet
  # 'subnet-05bc1a6b041b9f1fc' to prevent unintended changes or resource replacement.

  # Replace with the actual VPC ID this subnet belongs to.
  vpc_id = "vpc-0a1b2c3d4e5f6a7b8"
  # Replace with the actual CIDR block for this subnet.
  cidr_block = "10.0.1.0/24"
  # Replace with the actual Availability Zone this subnet resides in.
  availability_zone = "us-east-1a"
  # Set to 'true' for public subnets where EC2 instances need public IP addresses.
  # Set to 'false' for private subnets. Align this with the subnet's actual purpose.
  map_public_ip_on_launch = false
}