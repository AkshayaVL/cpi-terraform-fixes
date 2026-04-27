# Fix for CKV_AWS_SUB_TAG - Subnet subnet-05bc1a6b041b9f1fc has no Name tag — hard to identify public vs private
resource "aws_subnet" "subnet-05bc1a6b041b9f1fc" {
  # Use the existing subnet ID to update the resource
  id = "subnet-05bc1a6b041b9f1fc"
  
  # Add a 'Name' tag to identify the subnet as public or private
  tags = {
    # Use a descriptive name to differentiate between public and private subnets
    Name = "public-subnet" # Update this value based on the actual subnet type
    
    # Optionally, add additional tags for better resource management
    # Environment = "prod"
    # Owner       = "DevSecOps Team"
  }
  
  # No other changes are required, as this update only addresses the missing 'Name' tag
}