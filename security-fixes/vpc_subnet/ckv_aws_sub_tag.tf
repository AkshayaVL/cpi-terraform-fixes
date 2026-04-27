# Fix for CKV_AWS_SUB_TAG - Subnet subnet-00468dcae0b3091b0 has no Name tag — hard to identify public vs private
resource "aws_subnet" "subnet-00468dcae0b3091b0" {
  # Use the existing subnet ID to update the resource
  id = "subnet-00468dcae0b3091b0"
  
  # Add a 'Name' tag to identify the subnet as public or private
  tags = {
    # Use a descriptive name to identify the subnet
    Name = "public-subnet" # Update this to 'private-subnet' if the subnet is private
    
    # Optionally, add other relevant tags for organization and security
    Environment = "production"
    Owner        = "DevSecOps Team"
  }
  
  # Use the 'lifecycle' block to prevent accidental deletion of the subnet
  lifecycle {
    # Prevent Terraform from deleting the subnet
    prevent_destroy = true
  }
  
  # Use the 'depends_on' argument to ensure the subnet is updated after any dependent resources
  depends_on = [
    # Add dependent resources here, if any
  ]
}