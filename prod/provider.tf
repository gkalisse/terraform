provider "google" {
  project     = var.project
  region      = var.prod1_region
  alias       = "prod1"
}


provider "kubernetes" {
  alias = "prod1"
  client_certificate     = base64decode(module.prod1-gke.client_certificate)
  client_key             = base64decode(module.prod1-gke.client_key)
  cluster_ca_certificate = base64decode(module.prod1-gke.cluster_ca_certificate)
}

provider "tls" {}

#provider "google" {
#  project     = var.project
#  region      = var.prod2_region
#  alias       = "prod2"
#}