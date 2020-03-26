provider "google" {
  project     = var.project
  region      = var.region
}


provider "kubernetes" {
  client_certificate     = base64decode(module.non-prod-gke.client_certificate)
  client_key             = base64decode(module.non-prod-gke.client_key)
  cluster_ca_certificate = base64decode(module.non-prod-gke.cluster_ca_certificate)
}

provider "tls" {}