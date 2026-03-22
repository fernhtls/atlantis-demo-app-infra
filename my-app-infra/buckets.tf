resource "google_storage_bucket" "my-test-bucket" {
  name          = "my-test-bucket-atlantis"
  location      = "EU"
  force_destroy = true
}

