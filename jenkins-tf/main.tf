 resource "google_compute_instance" "test" {

  name         = "test"
  machine_type = "e2-medium"
  zone         = "europe-north1-b"
  
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
resource "google_compute_instance" "test1" {

  name         = "test1"
  machine_type = "e2-medium"
  zone         = "europe-north1-b"
  
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
