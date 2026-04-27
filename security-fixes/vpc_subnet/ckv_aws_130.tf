# Fix for CKV_AWS_130 - Subnet subnet-00468dcae0b3091b0 auto-assigns public IP to instances on launch
resource "aws_subnet" "subnet-00468dcae0b3091b0" {
  # Set the VPC ID to associate this subnet with
  vpc_id = "vpc-xxxxxxxxxxxxxxxxx"
  
  # Set the CIDR block for this subnet
  cidr_block = "10.0.1.0/24"
  
  # Set the availability zone for this subnet
  availability_zone = "us-west-2a"
  
  # Set map_public_ip_on_launch to false to prevent auto-assigning public IP addresses
  # This is the primary fix for the misconfiguration, as it prevents instances from being exposed to the internet by default
  map_public_ip_on_launch = false
  
  # Set the subnet ID to match the existing subnet
  id = "subnet-00468dcae0b3091b0"
  
  # Add tags to the subnet for identification and organization
  tags = {
    Name = "subnet-00468dcae0b3091b0"
  }
}