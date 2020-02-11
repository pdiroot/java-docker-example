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
    Tier        = "foundation"
  }
}

variable "workshop_net" {
  default = "10.52.0.0/18"
}

variable "workshop_subnets" {
  type = map(string)

  default = {
    "public.a" = "10.52.0.0/22"
    "public.b" = "10.52.4.0/22"
    "public.c" = "10.52.8.0/22"

    "applications.a" = "10.52.12.0/22"
    "applications.b" = "10.52.16.0/22"
    "applications.c" = "10.52.20.0/22"

    "databases.a" = "10.52.24.0/22"
    "databases.b" = "10.52.28.0/22"
    "databases.c" = "10.52.32.0/22"
  }
}
