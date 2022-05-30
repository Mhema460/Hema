module "startup_script" {
  
  source       ="../../"
 
}
  
resource "google_compute_instance" "jenkins-slave-new1" {

  name         = "jenkins-slave-new1"
  machine_type = "n2-standard-4"
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
