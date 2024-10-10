provider "google" {
  project = "playground-s-11-87a7301d"
  region  = var.region
}

terraform {
  backend "gcs" {
    bucket = "terraform-state-bucket"
    prefix = "terraform/state"
  }
}
