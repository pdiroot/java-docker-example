variable "profile" {
  default = "usatellite-terraform"
}

variable "region" {
  default = "eu-central-1"
}

variable "tags" {
  type = map(string)

  default = {
    Provisioner = "terraform"
    Project     = "workshop"
    Tier        = "database"
  }
}
