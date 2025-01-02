#################################################################################
### START Variables
#################################################################################

variable "project_id" {
  type        = string
  description = "Id for the Project"
}

variable "is_active" {
  type        = bool
  description = "Toggle, set to false to soft delete the Workload Identity Pool"
  default     = true
}

/******************************************
  Identity Pool Variables
*******************************************/

variable "pool_id" {
  type    = string
  default = "github-pool"
}

variable "pool_display_name" {
  type    = string
  default = "Github Pool"
}

variable "pool_description" {
  type    = string
  default = "Identity pool for Github Deployments"
}

variable "github_org" {
  type    = string
  default = "Go-Reply"
}

/******************************************
  Provider Variables
*******************************************/

variable "provider_id" {
  type    = string
  default = "github-provider"
}

variable "provider_attribute_mapping" {
  type        = map(string)
  description = "Attribute Mapping for Provider"
  default = {
    "google.subject"       = "assertion.sub"
    "attribute.actor"      = "assertion.actor"
    "attribute.aud"        = "assertion.aud"
    "attribute.repository" = "assertion.repository"
  }
}

variable "provider_issuer_uri" {
  type    = string
  default = "https://token.actions.githubusercontent.com"
}

/******************************************
  Service Account Variables
*******************************************/

variable "service_account_id" {
  type        = string
  description = "Account ID for Service Account"
  default     = "github-actions"
}

variable "sa_project_roles" {
  type        = list(string)
  description = "Set of Roles to assign to the Service Account"
  default     = []
}

variable "github_repo" {
  type        = string
  description = "Source Github Repo for Workload Federation"
}

#################################################################################
### END Variables
#################################################################################
