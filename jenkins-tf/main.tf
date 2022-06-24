resource "google_compute_instance" "master1" {

for_each     = local.master_details

  name         = each.key
  machine_type = each.value.machine_type
  zone         = each.value.zone
 
boot_disk {
    initialize_params {
      image = each.value.image
      size = each.value.os_disk_size
    }
  }

  network_interface {
         
     /*access_config {
   	 }*/
  }

 metadata_startup_script = file("${path.module}/master.sh")

}

resource "google_compute_instance" "slave1" {

  for_each     = local.slave_details

  name         = each.key
  machine_type = each.value.machine_type
  zone         = each.value.zone
  
boot_disk {
    initialize_params {
      image = each.value.image
      size = each.value.os_disk_size
    }
  }

  network_interface {
    
    /*access_config {
    }*/
  }

 metadata_startup_script = file("${path.module}/slave.sh")

}
