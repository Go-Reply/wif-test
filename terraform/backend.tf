terraform {
  backend "gcs" {
    bucket = "dft-iac-playground-tfstate" # Replace with your bucket name
    prefix = "create/"
  }
}