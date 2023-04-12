provider "google" {
  project = "your_project_id"
  region  = "us-central1"
}

resource "google_compute_instance" "default" {
  name         = "web-server"
  machine_type = "e2-medium"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2004-lts"
    }
  }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral IP
    }
  }

  metadata_startup_script = "sudo apt-get update && sudo apt-get install apache2 -y"
}
