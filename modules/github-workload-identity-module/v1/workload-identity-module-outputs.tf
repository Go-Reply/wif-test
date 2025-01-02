#################################################################################
### START Outputs
#################################################################################

locals {

  /******************************************
    LOCAL 
  *******************************************/

  current_timestamp   = timestamp()
  current_day_name    = formatdate("EEEE", local.current_timestamp)
  current_pretty_date = formatdate("DD MMM YYYY hh:mm:ss ZZZ", local.current_timestamp)
}

output "terraform_run_current_timestamp_github_workload_identity" {
  value = "[${local.current_timestamp}] - ${local.current_day_name} ${local.current_pretty_date}"
}

output "sa_member" {
  value = google_service_account.main.member
}

#################################################################################
### END Outputs
#################################################################################
