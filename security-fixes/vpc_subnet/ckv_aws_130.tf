# Fix for CKV_AWS_130 - Subnet subnet-05bc1a6b041b9f1fc auto-assigns public IP to instances on launch
resource "aws_subnet" "subnet-05bc1a6b041b9f1fc" {
  # Specify the VPC ID to ensure the subnet is created in the correct VPC
  vpc_id = "vpc-xxxxxxxxxxxxxxxxx"
  
  # Set the CIDR block for the subnet, following best practices for subnet sizing
  cidr_block = "10.0.1.0/24"
  
  # Set the availability zone for the subnet, ensuring high availability
  availability_zone = "us-west-2a"
  
  # Disable auto-assign public IP to prevent instances from being exposed to the internet
  map_public_ip_on_launch = false # This is the primary fix, disabling public IP auto-assignment
  
  # Add tags for resource identification and management
  tags = {
    Name        = "subnet-05bc1a6b041b9f1fc"
    Environment = "production"
  }
}