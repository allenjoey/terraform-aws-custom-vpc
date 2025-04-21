# Public Security Group

resource "aws_security_group" "public_sg" {
  name        = "Public-SG"
  description = "Public Internet Access"
  vpc_id      = aws_vpc.main.id

  ingress { # Ingress allow all access
    from_port        = 0
    to_port          = 0
    protocol         = -1
    cidr_blocks      = ["${var.external}"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress { # Egress allow all access
    from_port        = 0
    to_port          = 0
    protocol         = -1
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name       = "Public-SG"
    Managed_By = "terraform"
  }
}