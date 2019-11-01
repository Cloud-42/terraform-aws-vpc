resource "aws_security_group" "core_ssh" {
  name        = "core_ssh"
  description = "Allow inbound SSH from Given IP ranges"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = split(",", var.core_ssh_cidr_blocks)
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name          = "${var.environment}.sg.core_ssh"
    Environment   = var.environment
    Description   = "Default VPC SG allowing SSH access"
    Contact       = var.vpc_contact
    Orchestration = var.global_orchestration
  }
}

