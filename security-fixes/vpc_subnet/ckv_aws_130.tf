# Fix for CKV_AWS_130 - Subnet subnet-0285e19fb38a1532d auto-assigns public IP to instances on launch
resource "aws_subnet" "subnet-0285e19fb38a1532d" {
  # Set the VPC ID for the subnet, replace with the actual VPC ID
  vpc_id = "vpc-12345678"
  
  # Set the CIDR block for the subnet, replace with the actual CIDR block
  cidr_block = "10.0.1.0/24"
  
  # Set the availability zone for the subnet, replace with the actual availability zone
  availability_zone = "us-west-2a"
  
  # Set the map_public_ip_on_launch attribute to false to prevent auto-assignment of public IP addresses
  # This is the primary fix for the misconfiguration, as it prevents instances from being exposed to the internet by default
  map_public_ip_on_launch = false
  
  # Set the subnet ID, replace with the actual subnet ID
  # This is not a security-relevant change, but is necessary to identify the subnet
  id = "subnet-0285e19fb38a1532d"
  
  # Add tags to the subnet for identification and management purposes
  # This is a best practice, as it allows for easier management and monitoring of resources
  tags = {
    Name = "subnet-0285e19fb38a1532d"
  }
}