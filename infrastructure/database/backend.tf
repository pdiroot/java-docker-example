terraform {
  backend "s3" {
    profile = "usatellite-terraform"
    region  = "eu-central-1"
    bucket  = "usatellite-terraform"
    key     = "workshop-database"
  }
}
