resource "google_compute_instance" "instance" {

  name         = "instance"
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
