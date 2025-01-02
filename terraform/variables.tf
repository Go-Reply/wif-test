variable "project_id" {
  type        = string
  description = "Id for the Project"
}

variable "service_account_id" {
  type        = string
  description = "Account ID for Service Account"
  default     = "github-actions"
}

variable "provider_id" {
  type    = string
  default = "github-provider"
}

variable "github_repo" {
  type        = string
  description = "Source Github Repo for Workload Federation"
}

variable "sa_project_roles" {
  type        = list(string)
  description = "Set of Roles to assign to the Service Account"
  default     = []
}