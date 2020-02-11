resource "aws_vpc" "workshop" {
  cidr_block = var.workshop_net

  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = merge(var.tags, {
    "Name"                           = "workshop",
    "kubernetes.io/cluster/workshop" = "shared",
  })
}

resource "aws_default_route_table" "workshop" {
  default_route_table_id = aws_vpc.workshop.default_route_table_id

  tags = merge(var.tags, {
    "Name" = "workshop"
  })
}

resource "aws_default_security_group" "workshop" {
  vpc_id = aws_vpc.workshop.id

  tags = merge(var.tags, {
    "Name" = "workshop"
  })
}

resource "aws_internet_gateway" "workshop" {
  vpc_id = aws_vpc.workshop.id

  tags = merge(var.tags, {
    "Name" = "workshop"
  })
}

resource "aws_route" "workshop" {
  route_table_id = aws_default_route_table.workshop.id

  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.workshop.id
}
