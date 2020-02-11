resource "aws_security_group" "public" {
  vpc_id = aws_vpc.workshop.id

  name        = "public"
  description = "Rules for public tier"

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "all-tcp-ports"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(var.tags, {
    "Name" = "workshop.public"
  })
}

resource "aws_security_group" "applications" {
  vpc_id = aws_vpc.workshop.id

  name        = "applications"
  description = "Rules for application tier"

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "all-tcp-ports"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(var.tags, {
    "Name" = "workshop.applications"
  })
}

resource "aws_security_group" "databases" {
  vpc_id = aws_vpc.workshop.id

  name        = "databases"
  description = "Rules for database tier"

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "postgresql"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(var.tags, {
    "Name" = "workshop.databases"
  })
}
