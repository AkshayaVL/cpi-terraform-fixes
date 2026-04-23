# Fix for CKV_AWS_130 - Subnet subnet-079bd3fd7ff78126f auto-assigns public IP to instances on launch
resource "aws_subnet" "subnet-079bd3fd7ff78126f" {
  # Set the VPC ID for the subnet
  vpc_id = "vpc-xxxxxxxxxxxxxxxxx"
  
  # Set the CIDR block for the subnet
  cidr_block = "10.0.1.0/24"
  
  # Set the availability zone for the subnet
  availability_zone = "us-west-2a"
  
  # Set map_public_ip_on_launch to false to prevent auto-assigning public IP to instances
  map_public_ip_on_launch = false # This change prevents instances from being auto-assigned a public IP
  
  # Set the subnet tags
  tags = {
    Name = "subnet-079bd3fd7ff78126f"
  }
}