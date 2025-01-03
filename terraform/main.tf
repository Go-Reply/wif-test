#################################################################################
### START Main
#################################################################################

resource "google_storage_bucket" "static" {
 name          = "pipeline_bucket"
 location      = "US"
 storage_class = "STANDARD"
}
