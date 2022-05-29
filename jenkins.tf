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

resource "google_compute_instance" "jenkins-master-new1" {
  name         = "jenkins-master-new1"
  machine_type = "n2-standard-4"
  zone         = "europe-west1-d"

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
