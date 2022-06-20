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

resource "google_compute_instance" "hema" {

  name         = "hema"
  machine_type = "e2-medium"
  zone         = "europe-west1-b"
  
boot_disk {
    initialize_params {
      image = "ubuntu-1804-lts"
    }
  }

  network_interface {
    network = "default"
    access_config {
    }
  }
}
