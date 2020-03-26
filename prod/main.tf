#data "google_project" "project" {
#  #Project_ID will be same as provider, if not explicitly provided here
#}

module "prod1-gke" {
  source = "../modules/gke"
  providers = {
    google = google.prod1
  }
  project = var.project
  zone = var.prod1_zone
  environment = "prod"
  environment_sub = "1"
  node_count = 2
  node_machine_type = "n1-standard-2"
}

module "prod1-k8s" {
  source = "../modules/k8s"
  providers = {
    kubernetes = kubernetes.prod1
  }
  namespaces = var.prod1_namespaces
}

#module "prod2-gke" {
#  source = "../modules/gke"
#  project = var.project
#  zone = var.prod2_zone
#  environment = "prod"
#  environment_sub = "2"
#  node_count = 2
#  node_machine_type = "n1-standard-2"
#}
#
#module "prod2-k8s" {
#  source = "../modules/k8s"
#  providers = {
#    kubernetes = kubernetes.prod2
#  }
#  namespaces = var.prod2_namespaces
#}