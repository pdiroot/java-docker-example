resource "aws_subnet" "databases_a" {
  vpc_id = aws_vpc.workshop.id

  cidr_block        = var.workshop_subnets["databases.a"]
  availability_zone = "${var.region}a"

  tags = merge(var.tags, {
    "Name" = "workshop.databases.a"
  })
}

resource "aws_subnet" "databases_b" {
  vpc_id = aws_vpc.workshop.id

  cidr_block        = var.workshop_subnets["databases.b"]
  availability_zone = "${var.region}b"

  tags = merge(var.tags, {
    "Name" = "workshop.databases.b"
  })
}

resource "aws_subnet" "databases_c" {
  vpc_id = aws_vpc.workshop.id

  cidr_block        = var.workshop_subnets["databases.c"]
  availability_zone = "${var.region}c"

  tags = merge(var.tags, {
    "Name" = "workshop.databases.c"
  })
}

resource "aws_route_table" "databases_a" {
  vpc_id = aws_vpc.workshop.id

  tags = merge(var.tags, {
    "Name" = "workshop.databases.a"
  })
}

resource "aws_route_table" "databases_b" {
  vpc_id = aws_vpc.workshop.id

  tags = merge(var.tags, {
    "Name" = "workshop.databases.b"
  })
}

resource "aws_route_table" "databases_c" {
  vpc_id = aws_vpc.workshop.id

  tags = merge(var.tags, {
    "Name" = "workshop.databases.c"
  })
}

resource "aws_route_table_association" "databases_a" {
  subnet_id      = aws_subnet.databases_a.id
  route_table_id = aws_route_table.databases_a.id
}

resource "aws_route_table_association" "databases_b" {
  subnet_id      = aws_subnet.databases_b.id
  route_table_id = aws_route_table.databases_b.id
}

resource "aws_route_table_association" "databases_c" {
  subnet_id      = aws_subnet.databases_c.id
  route_table_id = aws_route_table.databases_c.id
}
