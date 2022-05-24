provider "google" {
  project     = "helical-song-350207"
  region      = "europe-west1"
}
resource "google_compute_firewall" "tcp-firewall-rule-8080" {
  name = "tcp-firewall-rule-8080-22-9070"
  network = "default"

  allow {
    protocol = "tcp"
    ports = ["8080", "22", "9070"]
  }
  source_ranges = ["0.0.0.0/0"]
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
