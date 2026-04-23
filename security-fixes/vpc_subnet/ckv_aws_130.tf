# Fix for CKV_AWS_130 - Subnet subnet-05bc1a6b041b9f1fc auto-assigns public IP to instances on launch
resource "aws_subnet" "example_private_subnet" {
  # In a real-world scenario, replace these placeholder values with the
  # actual VPC ID, CIDR block, and Availability Zone of the misconfigured subnet.
  # This Terraform resource block assumes you are modifying an existing subnet
  # managed by Terraform or importing an unmanaged subnet into your state.
  vpc_id                  = "vpc-0123456789abcdef0" # Replace with the actual VPC ID where the subnet resides
  cidr_block              = "10.0.1.0/24"             # Replace with the actual CIDR block of the subnet
  availability_zone       = "us-east-1a"              # Replace with the actual Availability Zone of the subnet

  # SECURITY FIX: Explicitly disable automatic public IP assignment for new instances.
  # Setting `map_public_ip_on_launch` to `false` ensures that EC2 instances
  # launched within this subnet will not automatically receive a public IPv4 address.
  # This significantly reduces the attack surface by preventing unintended direct
  # internet exposure for workloads that should remain private.
  map_public_ip_on_launch = false

  tags = {
    Name = "PrivateSubnetFixed" # Update the name to reflect its new private nature or existing name
  }
}