terraform {
  backend "gcs" {
    bucket = "hema-tf-state-prod"
    prefix = "terraform/state"
  }
}
