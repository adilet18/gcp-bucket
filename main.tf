resource "google_storage_bucket" "terraform_state" {
  name          = "terraform-state-bucket"
  location      = "US"
  storage_class = "STANDARD"
  force_destroy = true

  versioning {
    enabled = true # Enables versioning to prevent accidental state loss
  }

  lifecycle_rule {
    action {
      type = "Delete"
    }
    condition {
      age = 60 # Deletes versions older than 60 days
    }
  }
}
