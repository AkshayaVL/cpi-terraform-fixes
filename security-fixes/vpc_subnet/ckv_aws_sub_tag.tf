# Fix for CKV_AWS_SUB_TAG - Subnet subnet-01b42d8b272a7fb7a has no Name tag — hard to identify public vs private
resource "aws_subnet" "subnet-01b42d8b272a7fb7a" {
  # Assigning the existing subnet ID to update its tags
  id = "subnet-01b42d8b272a7fb7a"
  
  # Adding a 'Name' tag to identify the subnet as public or private
  tags = {
    # Using a descriptive name to differentiate between public and private subnets
    Name = "Private-Subnet"
    
    # Optional: Adding additional tags for better organization and security
    Environment = "Production"
    Owner        = "DevSecOps Team"
  }
  
  # Using lifecycle block to prevent accidental deletion of the subnet
  lifecycle {
    # Preventing the subnet from being deleted when the Terraform configuration is updated
    prevent_destroy = true
  }
}