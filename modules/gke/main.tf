#resource "google_project" "project" {
#  name       = var.project
#  project_id = var.project
#  billing_id =
#}
#
#resource "google_project_service" "project" {
#  project = var.project
#  service = "container.googleapis.com"
#}


resource "google_container_cluster" "primary" {
  name     = format("%s-%s%s", var.project, var.environment, var.environment_sub)
  location = var.zone
  project = var.project

  remove_default_node_pool = true
  initial_node_count       = 1

  master_auth {
    username = ""
    password = ""

    client_certificate_config {
      issue_client_certificate = false
    }
  }
}

resource "google_container_node_pool" "primary_preemptible_nodes" {
  name       = "main-node-pool"
  location   = var.zone
  cluster    = google_container_cluster.primary.name
  node_count = var.node_count

  node_config {
    preemptible  = true
    machine_type = var.node_machine_type

    metadata = {
      disable-legacy-endpoints = "true"
    }

    oauth_scopes = [
      "https://www.googleapis.com/auth/compute",
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]
  }
}