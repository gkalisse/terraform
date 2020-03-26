#data "google_project" "project" {
#  #Project_ID will be same as provider, if not explicitly provided here
#}

module "non-prod-gke" {
  source = "../modules/gke"
  project = var.project
  zone = var.zone
  environment = "nonprod"
  #environment_sub = ""
  node_count = 2
  node_machine_type = "n1-standard-2"
}

module "non-prod-k8s" {
  source = "../modules/k8s"
  namespaces = var.namespaces
}