resource "aws_db_subnet_group" "workshop" {
  name       = "workshop"
  subnet_ids = data.terraform_remote_state.foundation.outputs.databases_subnets

  tags = merge(var.tags, {
    "Name" = "workshop"
  })
}

resource "random_password" "workshop" {
  length  = 8
  special = false
}

resource "aws_db_instance" "workshop" {
  identifier = "workshop"

  engine         = "postgres"
  engine_version = "11.5"

  instance_class = "db.t3.small"

  allocated_storage     = 8
  max_allocated_storage = 24
  storage_type          = "gp2"

  name     = "workshop"
  username = "workshop"
  password = random_password.workshop.result

  maintenance_window = "Mon:00:00-Mon:02:00"

  backup_window           = "02:00-04:00"
  backup_retention_period = 7

  db_subnet_group_name = aws_db_subnet_group.workshop.id

  vpc_security_group_ids = [
    data.terraform_remote_state.foundation.outputs.databases_security_group
  ]

  apply_immediately   = true
  skip_final_snapshot = true

  tags = var.tags
}
