locals {
  common_tags = {
    owner      = lower(var.owner)
    stage      = lower(var.stage)
    project    = lower(var.project)
    start_date = var.start_date
    end_date   = var.end_date
    managed_by = "terraform"
    email      = var.email
    Objective  = var.Objective
    Expiration = "true"
  }
}
