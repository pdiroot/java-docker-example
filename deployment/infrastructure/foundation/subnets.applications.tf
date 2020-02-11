resource "aws_subnet" "applications_a" {
  vpc_id = aws_vpc.workshop.id

  cidr_block        = var.workshop_subnets["applications.a"]
  availability_zone = "${var.region}a"

  tags = merge(var.tags, {
    "Name"                           = "workshop.applications.a",
    "kubernetes.io/cluster/workshop" = "shared",
  })
}

resource "aws_subnet" "applications_b" {
  vpc_id = aws_vpc.workshop.id

  cidr_block        = var.workshop_subnets["applications.b"]
  availability_zone = "${var.region}b"

  tags = merge(var.tags, {
    "Name"                           = "workshop.applications.b",
    "kubernetes.io/cluster/workshop" = "shared",
  })
}

resource "aws_subnet" "applications_c" {
  vpc_id = aws_vpc.workshop.id

  cidr_block        = var.workshop_subnets["applications.c"]
  availability_zone = "${var.region}c"

  tags = merge(var.tags, {
    "Name"                           = "workshop.applications.c",
    "kubernetes.io/cluster/workshop" = "shared",
  })
}

resource "aws_route_table" "applications_a" {
  vpc_id = aws_vpc.workshop.id

  tags = merge(var.tags, {
    "Name" = "workshop.applications.a"
  })
}

resource "aws_route_table" "applications_b" {
  vpc_id = aws_vpc.workshop.id

  tags = merge(var.tags, {
    "Name" = "workshop.applications.b"
  })
}

resource "aws_route_table" "applications_c" {
  vpc_id = aws_vpc.workshop.id

  tags = merge(var.tags, {
    "Name" = "workshop.applications.c"
  })
}

resource "aws_route_table_association" "applications_a" {
  subnet_id      = aws_subnet.applications_a.id
  route_table_id = aws_route_table.applications_a.id
}

resource "aws_route_table_association" "applications_b" {
  subnet_id      = aws_subnet.applications_b.id
  route_table_id = aws_route_table.applications_b.id
}

resource "aws_route_table_association" "applications_c" {
  subnet_id      = aws_subnet.applications_c.id
  route_table_id = aws_route_table.applications_c.id
}

resource "aws_route" "applications_a" {
  route_table_id = aws_route_table.applications_a.id

  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.public_a.id
}

resource "aws_route" "applications_b" {
  route_table_id = aws_route_table.applications_b.id

  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.public_b.id
}

resource "aws_route" "applications_c" {
  route_table_id = aws_route_table.applications_c.id

  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.public_c.id
}
