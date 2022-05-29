provider "google" {
  project  = "helical-song-350207"
  region  = "europe-west1"
}
terraform {
  backend "gcs" {
    bucket = "hema-tf-state-prod"
    prefix = "terraform/state"
  }
}
module "kylo_ren" {
  source           = "../DEV/**"
  gcp_project_id   = helical-song-350207
  vpc_network_name = "default"
  instance_name    = "kylo-ren"
  network_tags     = ["http-server", "https-server"]
}
