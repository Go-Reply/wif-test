#################################################################################
### START Main
#################################################################################

resource "google_storage_bucket" "static" {
 name          = "test-je-pipeline-bucket"
 location      = "US"
 storage_class = "STANDARD"
}
