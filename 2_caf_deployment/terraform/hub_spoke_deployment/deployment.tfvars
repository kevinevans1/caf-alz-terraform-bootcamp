subscription_id_management      = ""
subscription_id_identity        = ""
subscription_id_connectivity    = ""
root_id                         = "myorg-mr"
root_name                       = "My OrganizationMR"
deploy_connectivity_resources   = true
connectivity_resources_location = "canadacentral"
connectivity_resources_tags = {
  demo_type = "deploy_connectivity_resources_custom"
}
deploy_identity_resources     = true
deploy_management_resources   = true
log_retention_in_days         = 50
security_alerts_email_address = "mail@microsoft.com"
management_resources_location = "canadacentral"
management_resources_tags = {
  demo_type = "deploy_management_resources_custom"
}
