terraform {
  backend "gcs" {
    bucket = "tf-state-for-go-reply-sandbox" # Replace with your bucket name
    prefix = "github-pipeline-test-state/"
  }
}