#################################################################################
### START Main
#################################################################################

resource "google_iam_workload_identity_pool" "main" {
  project                   = var.project_id
  workload_identity_pool_id = var.pool_id
  display_name              = var.pool_display_name
  description               = var.pool_description
  disabled                  = !var.is_active
}

resource "google_iam_workload_identity_pool_provider" "main" {
  project                            = var.project_id
  workload_identity_pool_id          = google_iam_workload_identity_pool.main.workload_identity_pool_id
  workload_identity_pool_provider_id = var.provider_id
  attribute_mapping                  = var.provider_attribute_mapping
  attribute_condition                = "assertion.repository_owner==\"${var.github_org}\""
  oidc {
    issuer_uri = var.provider_issuer_uri
  }
}

/******************************************
  Service Account Creation for Workload
*******************************************/

resource "google_service_account" "main" {
  project      = var.project_id
  account_id   = var.service_account_id
  display_name = "Service Account used for GitHub Actions managed by TF"
}

# Assign WorkloadIdentityUser to ServiceAccount
resource "google_service_account_iam_member" "main" {
  service_account_id = google_service_account.main.name
  role               = "roles/iam.workloadIdentityUser"
  member             = "principalSet://iam.googleapis.com/${google_iam_workload_identity_pool.main.name}/attribute.repository/${var.github_repo}"
}

resource "google_project_iam_member" "main" {
  for_each = toset(var.sa_project_roles)
  project  = var.project_id
  role     = each.value
  member   = google_service_account.main.member
}

#################################################################################
### END Main
#################################################################################
