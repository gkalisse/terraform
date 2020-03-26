variable "project" {
  default = "gk-mission"
}
variable "region" {
  default = "us-east1"
}
variable "zone" {
  default = "us-east1-c"
}

variable "namespaces" {
  type = list(string)
  default = [
    "jenkins",
    "jenkins-slaves",
    "ingress-controller",
    "sample-app",
  ]
}