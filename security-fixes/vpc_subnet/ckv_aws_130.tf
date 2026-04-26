# Fix for CKV_AWS_130 - Subnet subnet-0285e19fb38a1532d auto-assigns public IP to instances on launch
resource "aws_subnet" "subnet-0285e19fb38a1532d" {
  # Set the VPC ID to the ID of the VPC where the subnet is located
  vpc_id = "vpc-xxxxxxxxxxxxxxxxx"
  # Set the CIDR block for the subnet
  cidr_block = "10.0.1.0/24"
  # Set the availability zone for the subnet
  availability_zone = "us-west-2a"
  # Set the map_public_ip_on_launch attribute to false to prevent auto-assignment of public IP addresses
  map_public_ip_on_launch = false # This change fixes the misconfiguration by disabling public IP auto-assignment
  # Set the subnet ID to the ID of the subnet being updated
  id = "subnet-0285e19fb38a1532d"
  # Set the tags for the subnet
  tags = {
    # Add a tag to track the purpose of the subnet
    Name = "private-subnet"
  }
}