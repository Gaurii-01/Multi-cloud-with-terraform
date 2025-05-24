terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
		}
	}
}

provider "google" {

  project = var.id_project
  region  = var.instance_region
  zone    = var.instance_zone
}

resource google_compute_instance "vm_instance" {
name         = var.instance_name
zone         = var.instance_zone
machine_type = "e2-micro"
boot_disk {
    initialize_params {
      image = var.name_image
      }
   }
network_interface {
    network = "default"
    access_config {
      # Allocate a one-to-one NAT IP to the instance
    }
  }
}