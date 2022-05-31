module "startup_script_slave" {
  
  source       ="../../"
 
}
  
resource "google_compute_instance" "jenkins-slave-1" {

  name         = "jenkins-slave-1"
  machine_type = "e2-micro"
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

 metadata_startup_script = file("${path.module}/script/slave.sh")

}
