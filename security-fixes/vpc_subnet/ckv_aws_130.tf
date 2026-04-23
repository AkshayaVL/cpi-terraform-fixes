# Fix for CKV_AWS_130 - Subnet subnet-05bc1a6b041b9f1fc auto-assigns public IP to instances on launch
resource "aws_subnet" "subnet-05bc1a6b041b9f1fc" {
  # WARNING: The 'vpc_id', 'cidr_block', and 'availability_zone' attributes
  # are essential for a complete aws_subnet resource definition.
  # These values MUST match the existing configuration of your subnet
  # 'subnet-05bc1a6b041b9f1fc' to avoid unintended changes or resource recreation.
  # Replace the placeholder values below with the actual configuration details of your subnet.
  vpc_id                  = "vpc-0123456789abcdef0" # Placeholder: Replace with the actual VPC ID of the subnet.
  cidr_block              = "10.0.1.0/24"           # Placeholder: Replace with the actual CIDR block of the subnet.
  availability_zone       = "us-east-1a"            # Placeholder: Replace with the actual Availability Zone of the subnet.

  # SECURITY FIX: Disables automatic assignment of public IP addresses to new EC2 instances.
  # Setting 'map_public_ip_on_launch' to 'false' is a critical security best practice.
  # This change prevents instances from being directly exposed to the internet by default,
  # significantly reducing the attack surface. Instances launched in this subnet will now
  # only receive private IP addresses, enhancing network segmentation and control.
  # Access to/from the internet for these instances will require explicit configurations
  # like NAT gateways/instances or bastion hosts, improving security posture.
  map_public_ip_on_launch = false

  # AWS Best Practice: Include any existing tags for this subnet to prevent their removal
  # during a Terraform apply. Ensure these tags match the current state of your subnet in AWS.
  tags = {
    Name = "my-application-private-subnet" # Placeholder: Update with actual Name tag, if exists, or adjust as needed.
    # Add other existing tags here to maintain current metadata, e.g.:
    # Environment = "production"
    # Project     = "myproject"
  }
}