# Fix for CKV_AWS_25_MySQL - Security group cpi-demo-sg exposes MySQL (port 3306) to the internet
resource "aws_security_group" "cpi-demo-sg" {
  # Update the existing security group to restrict inbound traffic
  name        = "cpi-demo-sg"
  description = "Security group for CPI demo"
  vpc_id      = "vpc-12345678" # replace with the actual VPC ID

  # Remove the existing inbound rule that exposes MySQL to the internet
  # and replace it with a new rule that only allows inbound traffic from a specific IP or security group
  ingress {
    # Restrict MySQL access to only allow connections from a specific IP address
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"] # replace with a specific IP address or range
    # Alternatively, you can use a security group as the source
    # security_groups = [aws_security_group.example.id]
  }

  # Ensure all outbound traffic is allowed
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Add tags for better management and monitoring
  tags = {
    Name        = "cpi-demo-sg"
    Environment = "production"
  }
}