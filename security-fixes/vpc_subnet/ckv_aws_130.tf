# Fix for CKV_AWS_130 - Subnet subnet-05bc1a6b041b9f1fc auto-assigns public IP to instances on launch
resource "aws_subnet" "subnet-05bc1a6b041b9f1fc" {
  # Specify the VPC ID to which this subnet belongs
  vpc_id = "vpc-xxxxxxxxxxxxxxxxx"
  
  # Set the CIDR block for this subnet
  cidr_block = "10.0.1.0/24"
  
  # Set the availability zone for this subnet
  availability_zone = "us-west-2a"
  
  # Set map_public_ip_on_launch to false to prevent auto-assigning public IP addresses
  # This is the primary fix for the misconfiguration, as it prevents instances from being exposed to the internet by default
  map_public_ip_on_launch = false
  
  # Add tags for identification and organization
  tags = {
    Name        = "subnet-05bc1a6b041b9f1fc"
    Environment = "production"
  }
}