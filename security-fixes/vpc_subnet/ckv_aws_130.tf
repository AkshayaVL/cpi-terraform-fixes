# Fix for CKV_AWS_130 - Subnet subnet-01b42d8b272a7fb7a auto-assigns public IP to instances on launch
resource "aws_subnet" "subnet-01b42d8b272a7fb7a" {
  # Set the VPC ID to the ID of the VPC where the subnet is located
  vpc_id = "vpc-12345678"
  # Set the CIDR block for the subnet
  cidr_block = "10.0.1.0/24"
  # Set the availability zone for the subnet
  availability_zone = "us-west-2a"
  # Set the map_public_ip_on_launch attribute to false to prevent auto-assignment of public IP addresses
  map_public_ip_on_launch = false # Disable auto-assignment of public IP addresses to instances launched in this subnet
  # Set the subnet ID to the ID of the existing subnet
  id = "subnet-01b42d8b272a7fb7a"
  # Set the tags for the subnet
  tags = {
    Name = "subnet-01b42d8b272a7fb7a"
  }
}