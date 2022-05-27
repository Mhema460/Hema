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

resource "google_storage_bucket" "bucket" {
  name = "test-bucket-460"
}
