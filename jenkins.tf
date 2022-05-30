resource "google_compute_instance" "jenkins-master-new1" {

  name         = "jenkins-master-new1"
  machine_type = "n2-standard-4"
  zone         = "europe-west1-b"
  source       = "./script"
 
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

 metadata_startup_script = "./script/master.sh"

}
