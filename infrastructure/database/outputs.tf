output "endpoint" {
  value = aws_db_instance.workshop.endpoint
}

output "dbname" {
  value = aws_db_instance.workshop.name
}

output "username" {
  value = aws_db_instance.workshop.username
}

output "password" {
  value = random_password.workshop.result
}
