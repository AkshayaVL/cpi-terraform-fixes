# Fix for CKV_AWS_SUB_TAG - Subnet subnet-0589a37cbe964dde1 has no Name tag — hard to identify public vs private
resource "aws_subnet" "subnet-0589a37cbe964dde1" {
  # Specify the VPC ID to which the subnet belongs, ensuring it's properly associated with the correct VPC
  vpc_id = "vpc-12345678"
  
  # Define the CIDR block for the subnet, following best practices for subnet sizing and IP address allocation
  cidr_block = "10.0.1.0/24"
  
  # Specify the Availability Zone for the subnet, ensuring high availability and fault tolerance
  availability_zone = "us-west-2a"
  
  # Add a 'Name' tag to the subnet, allowing for easy identification and distinction between public and private subnets
  tags = {
    # Assign a descriptive name to the subnet, indicating its purpose and type (public or private)
    Name = "private-subnet-us-west-2a"
    
    # Optionally, add additional tags for further categorization and filtering
    Environment = "production"
    Type = "private"
  }
}