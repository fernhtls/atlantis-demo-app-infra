resource "google_storage_bucket" "my-test-bucket" {
  name          = "my-test-bucket-atlantis"
  location      = var.default_location
  force_destroy = true
}

