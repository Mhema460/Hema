terraform {
  
  required_providers {
  google = {
    source = "hashicorp/google"
    version = "~>4.16.0"
  }
    
  google-beta = {
    source = "hashicorp/google-beta"
    version = "~>3.0"
   }
  }
}

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
