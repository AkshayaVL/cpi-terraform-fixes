# Fix for CKV_AWS_SUB_TAG - Subnet subnet-0285e19fb38a1532d has no Name tag — hard to identify public vs private
resource "aws_subnet" "subnet-0285e19fb38a1532d" {
  # Assign a unique id to the subnet resource for Terraform state management
  id = "subnet-0285e19fb38a1532d"
  
  # Define the VPC ID where the subnet belongs
  vpc_id = "vpc-xxxxxxxxxxxxxxxxx" # replace with the actual VPC ID
  
  # Specify the CIDR block for the subnet
  cidr_block = "10.0.1.0/24" # replace with the actual CIDR block
  
  # Define the Availability Zone for the subnet
  availability_zone = "us-west-2a" # replace with the actual Availability Zone
  
  # Add a 'Name' tag to identify the subnet as public or private
  tags = {
    # Assign a descriptive name to the subnet for easy identification
    Name = "public-subnet-us-west-2a" # replace with the actual subnet name
    
    # Optionally, add other relevant tags for resource management and security
    Environment = "production"
    Owner = "DevSecOps Team"
  }
}