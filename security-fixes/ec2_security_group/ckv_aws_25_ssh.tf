# Fix for CKV_AWS_25_SSH - Security group cpi-demo-sg exposes SSH (port 22) to the internet
resource "aws_security_group" "cpi-demo-sg" {
  # Update the existing security group to restrict SSH access
  name        = "cpi-demo-sg"
  description = "Security group for CPI demo"
  vpc_id      = "vpc-12345678" # replace with the actual VPC ID

  # Remove the existing rule that exposes SSH to the internet
  # and replace it with a new rule that only allows SSH from a specific IP address
  ingress {
    # Restrict SSH access to a specific IP address (e.g., a bastion host or a trusted IP)
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["192.0.2.1/32"] # replace with the actual trusted IP address
    # Alternatively, use a security group ID to allow SSH from a specific security group
    # security_groups = [aws_security_group.bastion-sg.id]
  }

  # Allow outbound traffic to any IP address
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Tag the security group for better management and monitoring
  tags = {
    Name        = "cpi-demo-sg"
    Environment = "production"
  }
}