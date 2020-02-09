data "terraform_remote_state" "foundation" {
  backend = "s3"

  config = {
    profile = "usatellite-terraform"
    region  = "eu-central-1"
    bucket  = "usatellite-terraform"
    key     = "workshop-foundation"
  }
}
