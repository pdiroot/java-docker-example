output "public_subnets" {
  value = [
    aws_subnet.public_a.id,
    aws_subnet.public_b.id,
    aws_subnet.public_c.id,
  ]
}

output "applications_subnets" {
  value = [
    aws_subnet.applications_a.id,
    aws_subnet.applications_b.id,
    aws_subnet.applications_c.id,
  ]
}

output "databases_subnets" {
  value = [
    aws_subnet.databases_a.id,
    aws_subnet.databases_b.id,
    aws_subnet.databases_c.id,
  ]
}

output "public_security_group" {
  value = aws_security_group.public.id
}

output "databases_security_group" {
  value = aws_security_group.databases.id
}

output "applications_security_group" {
  value = aws_security_group.applications.id
}
