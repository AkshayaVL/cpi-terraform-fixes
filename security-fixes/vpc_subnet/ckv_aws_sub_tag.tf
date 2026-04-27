# Fix for CKV_AWS_SUB_TAG - Subnet subnet-079bd3fd7ff78126f has no Name tag — hard to identify public vs private
resource "aws_subnet" "subnet-079bd3fd7ff78126f" {
  # Assign a unique identifier to the subnet resource
  id = "subnet-079bd3fd7ff78126f"
  
  # Update the existing subnet with a 'Name' tag for identification purposes
  tags = {
    # Add a 'Name' tag to identify the subnet as public or private
    Name = "public-subnet" # update this value to reflect the actual subnet type
  }
  
  # Use the 'lifecycle' block to prevent accidental deletion of the subnet
  lifecycle {
    # Prevent Terraform from deleting the subnet when the configuration is updated
    prevent_destroy = true
  }
}