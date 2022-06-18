module "startup_script" {
  
  source       ="../../"
 
}
  
resource "google_compute_instance" "jenkins-master-1" {

  name         = "jenkins-master-1"
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

 metadata_startup_script = file("${path.module}/script/master.sh")

}
