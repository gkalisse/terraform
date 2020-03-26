variable "project" {
  default = "gk-mission"
}
variable "prod1_region" {
  default = "us-east1"
}
variable "prod1_zone" {
  default = "us-east1-c"
}

variable "prod1_namespaces" {
  type = list(string)
  default = [
    "jenkins",
    "ingress-controller",
    "sample-app",
  ]
}

#variable "prod2_region" {
#  default = "us-east1"
#}
#variable "prod2_zone" {
#  default = "us-east1-c"
#}

#variable "prod2_namespaces" {
#  type = list(string)
#  default = [
#    "jenkins",
#    "ingress-controller",
#    "sample-app",
#  ]
#}
