provider "google" {
  project = "helical-song-350207"
  region  = "europe-west1"
}

terraform {
  backend "gcs" {
    bucket = "hema-tf-state-prod"
    prefix = "terraform/state"
  }
}
