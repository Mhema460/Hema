module "startup_script_instance1" {
  
  source       ="../../"
 
}
  
resource "google_compute_instance" "instance1" {

  name         = "instance1"
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

 metadata_startup_script = file("${path.module}/script/master.sh")

}
