terraform {
  backend "gcs" {
    bucket  = "gkmission"
    prefix  = "terraform/state"
  }
}
