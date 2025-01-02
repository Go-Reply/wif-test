#################################################################################
### START Main
#################################################################################

module "workload-identity-module" {
    source              = "../modules/workload-identity-module"    
    project_id          = var.project_id
    pool_id             = "github-pool2"
    pool_display_name   = "GitHub Pool 2"

    provider_id         = var.provider_id

    service_account_id  = var.service_account_id
    sa_project_roles    = var.sa_project_roles
    github_repo         = var.github_repo
  
}

# resource "google_iam_workload_identity_pool" "github_pool" {
#   project = var.project_id
#   workload_identity_pool_id = "github-pool1"
#   display_name              = "GitHub Pool 1"
#   description               = "Identity pool for testing WIF with github"
# }