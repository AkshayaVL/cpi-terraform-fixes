# Fix for CKV_AWS_130 - Subnet subnet-0589a37cbe964dde1 auto-assigns public IP to instances on launch
resource "aws_subnet" "subnet-0589a37cbe964dde1" {
  # Set the VPC ID for the subnet
  vpc_id = "vpc-xxxxxxxxxxxxxxxxx"
  
  # Set the CIDR block for the subnet
  cidr_block = "10.0.1.0/24"
  
  # Set the availability zone for the subnet
  availability_zone = "us-west-2a"
  
  # Disable auto-assign public IP to prevent instances from being exposed to the internet
  map_public_ip_on_launch = false # This is the primary fix, setting this to false prevents public IP auto-assignment
  
  # Add tags for resource identification and management
  tags = {
    Name        = "subnet-0589a37cbe964dde1"
    Environment = "production"
  }
}