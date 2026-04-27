# Fix for CKV_AWS_25 - Security group cpi-demo-sg allows ALL inbound traffic from internet (0.0.0.0/0)
resource "aws_security_group" "cpi_demo_sg" {
  # Create a new security group to replace the misconfigured one
  name        = "cpi-demo-sg-remediated"
  description = "Remediated security group for cpi-demo"
  vpc_id      = "vpc-12345678" # Replace with the actual VPC ID

  # Restrict inbound traffic to only necessary ports and sources
  ingress {
    # Allow SSH from a specific IP address or range (replace with your IP)
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["192.0.2.1/32"] # Replace with your IP address
  }

  # Allow HTTP and HTTPS from a specific IP address or range (replace with your IP)
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["192.0.2.1/32"] # Replace with your IP address
  }
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["192.0.2.1/32"] # Replace with your IP address
  }

  # Allow outbound traffic to anywhere
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Tag the security group for identification and management
  tags = {
    Name        = "cpi-demo-sg-remediated"
    Environment = "production"
  }
}