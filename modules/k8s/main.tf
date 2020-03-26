resource "kubernetes_namespace" "namespace" {
for_each = {for ns in var.namespaces : ns => ns }
  metadata {
    name = each.value
  }
}

#resource "kubernetes_service_account" "service_account" {
#  metadata {
#    name = "deployer"
#    naespace = "sam"
#  }
#  secret {
#    name = kubernetes_secret.service_account_secret.metadata.0.name
#  }
#}
#
#resource "kubernetes_secret" "service_account_secret" {
#  metadata {
#    name = "deployer"
#  }
#}