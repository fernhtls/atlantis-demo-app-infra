variable "gcp_project_id" {
  type    = string
  default = "atlantis-demo-app"
}

variable "default_region" {
  type        = string
  description = "GCP default region to create resources"
  default     = "europe-west4"
}

variable "default_location" {
  type        = string
  description = "GCP default location to create resources"
  default     = "europe-west4-a"
}

