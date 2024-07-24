provider "google" {
  project     = var.project_id
  region      = var.region
  credentials = file(var.GOOGLE_CREDENTIALS_FILE)
  
}

terraform {
  backend "gcs" {
    bucket = "main_project_state_143"
    prefix = "terraform/state"
  }
}

resource "google_compute_network" "default" {
  name = "k8s-network"
}

resource "google_compute_subnetwork" "default" {
  name          = "k8s-subnetwork"
  ip_cidr_range = "10.0.0.0/16"
  network       = google_compute_network.default.id
}

resource "google_compute_instance" "k8s-master" {
  name         = "k8s-master"
  machine_type = "e2-standard-2"
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = "ubuntu-2204-jammy-v20240701"
    }
  }

  network_interface {
    network    = google_compute_network.default.id
    subnetwork = google_compute_subnetwork.default.id
    access_config {
    }
  }

  metadata = {
    ssh-keys = "vengalasanjay000:${file("~/gcp_ssh.pub")}"
  }
}

resource "google_compute_instance" "k8s-node-1" {
  name         = "k8s-node-1"
  machine_type = "e2-medium"
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = "ubuntu-2204-jammy-v20240701"
    }
  }

  network_interface {
    network    = google_compute_network.default.id
    subnetwork = google_compute_subnetwork.default.id
    access_config {
    }
  }

  metadata = {
    ssh-keys = "vengalasanjay000:${file("~/gcp_ssh.pub")}"
  }
}

resource "google_compute_instance" "k8s-node-2" {
  name         = "k8s-node-2"
  machine_type = "e2-medium"
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = "ubuntu-2204-jammy-v20240701"
    }
  }

  network_interface {
    network    = google_compute_network.default.id
    subnetwork = google_compute_subnetwork.default.id
    access_config {
    }
  }

  metadata = {
    ssh-keys = "vengalasanjay000:${file("~/gcp_ssh.pub")}"
  }
}

resource "google_compute_firewall" "allow-all" {
  name    = "allow-all"
  network = google_compute_network.default.id

  allow {
    protocol = "all"
  }

  source_ranges = ["0.0.0.0/0"]
}
