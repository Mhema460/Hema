variable "region" {
  description = "The region in which the machine should be created in"
  default     = "europe-west1"
}

variable "project_name" {
  description = "The ID of the project"
  default     = "helical-song-350207"
}


locals {

    master_details = {

     "master1"  = {
        machine_type                         = "e2-medium" , 
        zone                                 = "europe-west1-b" ,
        image                                = "ubuntu-1804-lts" ,
        os_disk_size                         = "20" ,
        network 	                     = "default",
      


          }

	}
     
     slave_details = {

     "slave1"  = {
        machine_type                         = "e2-medium" , 
        zone                                 = "europe-west1-b" ,
        image                                = "ubuntu-1804-lts" ,
        os_disk_size                         = "20" ,
        network 	                     = "default",
        
          }

	}
   }
