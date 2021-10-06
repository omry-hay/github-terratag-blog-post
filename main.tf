terraform {
  backend "gcs" {
    bucket  = "env0-gcp-backend-state-bucket"
    prefix  = "terraform/state"
  }

  required_providers {
    google = {
      source = "hashicorp/google"
      version = "3.78.0"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
  zone    = var.zone
}

resource "google_compute_instance" "vm_instance" {
  name         = "terraform-instance-github"
  machine_type = var.machine_type

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    # A default network is created for all GCP projects
    network = google_compute_network.vpc_network.self_link
    access_config {
    }
  }
}

resource "google_compute_network" "vpc_network" {
  name                    = "terraform-network-github"
  auto_create_subnetworks = "true"
}
