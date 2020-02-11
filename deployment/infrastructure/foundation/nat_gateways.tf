resource "aws_eip" "nat_gateway_a" {
  tags = merge(var.tags, {
    "Name" = "workshop.nat_gateway.a"
  })
}

resource "aws_eip" "nat_gateway_b" {
  tags = merge(var.tags, {
    "Name" = "workshop.nat_gateway.b"
  })
}

resource "aws_eip" "nat_gateway_c" {
  tags = merge(var.tags, {
    "Name" = "workshop.nat_gateway.c"
  })
}

resource "aws_nat_gateway" "public_a" {
  subnet_id     = aws_subnet.public_a.id
  allocation_id = aws_eip.nat_gateway_a.id

  tags = merge(var.tags, {
    "Name" = "workshop.a"
  })
}

resource "aws_nat_gateway" "public_b" {
  subnet_id     = aws_subnet.public_b.id
  allocation_id = aws_eip.nat_gateway_b.id

  tags = merge(var.tags, {
    "Name" = "workshop.b"
  })
}

resource "aws_nat_gateway" "public_c" {
  subnet_id     = aws_subnet.public_c.id
  allocation_id = aws_eip.nat_gateway_c.id

  tags = merge(var.tags, {
    "Name" = "workshop.c"
  })
}
