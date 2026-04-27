# Fix for CKV_AWS_130 - Subnet subnet-0fc4871377f8654ba auto-assigns public IP to instances on launch
resource "aws_subnet" "subnet-0fc4871377f8654ba" {
  # Set the VPC ID to the ID of the VPC where the subnet is located
  vpc_id = "vpc-xxxxxxxxxxxxxxxxx"
  # Set the CIDR block for the subnet
  cidr_block = "10.0.1.0/24"
  # Set the availability zone for the subnet
  availability_zone = "us-west-2a"
  # Set the map_public_ip_on_launch attribute to false to prevent auto-assignment of public IP addresses
  map_public_ip_on_launch = false # This change fixes the misconfiguration by disabling public IP auto-assignment
  # Set the subnet ID to the ID of the subnet being updated
  id = "subnet-0fc4871377f8654ba"
  # Add tags to the subnet for identification and management
  tags = {
    Name = "subnet-0fc4871377f8654ba"
  }
}