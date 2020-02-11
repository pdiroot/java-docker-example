resource "aws_subnet" "public_a" {
  vpc_id = aws_vpc.workshop.id

  cidr_block        = var.workshop_subnets["public.a"]
  availability_zone = "${var.region}a"

  map_public_ip_on_launch = true

  tags = merge(var.tags, {
    "Name"                           = "workshop.public.a",
    "kubernetes.io/cluster/workshop" = "shared",
  })
}

resource "aws_subnet" "public_b" {
  vpc_id = aws_vpc.workshop.id

  cidr_block        = var.workshop_subnets["public.b"]
  availability_zone = "${var.region}b"

  map_public_ip_on_launch = true

  tags = merge(var.tags, {
    "Name"                           = "workshop.public.b",
    "kubernetes.io/cluster/workshop" = "shared",
  })
}

resource "aws_subnet" "public_c" {
  vpc_id = aws_vpc.workshop.id

  cidr_block        = var.workshop_subnets["public.c"]
  availability_zone = "${var.region}c"

  map_public_ip_on_launch = true

  tags = merge(var.tags, {
    "Name"                           = "workshop.public.c",
    "kubernetes.io/cluster/workshop" = "shared",
  })
}

resource "aws_route_table_association" "public_a" {
  subnet_id      = aws_subnet.public_a.id
  route_table_id = aws_default_route_table.workshop.id
}

resource "aws_route_table_association" "public_b" {
  subnet_id      = aws_subnet.public_b.id
  route_table_id = aws_default_route_table.workshop.id
}

resource "aws_route_table_association" "public_c" {
  subnet_id      = aws_subnet.public_c.id
  route_table_id = aws_default_route_table.workshop.id
}
