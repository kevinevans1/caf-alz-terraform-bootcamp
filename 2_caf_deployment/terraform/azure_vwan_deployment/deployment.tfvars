subscription_id_connectivity    = "your_subscription_id_for_connectivity"
subscription_id_identity        = "your_subscription_id_for_identity"
subscription_id_management      = "your_subscription_id_for_management"
root_id                         = "myorg"
root_name                       = "My Organization"
deploy_connectivity_resources   = true
connectivity_resources_location = "canadacentral"
connectivity_resources_tags = {
  demo_type = "deploy_connectivity_resources_custom"
}
deploy_identity_resources     = true
deploy_management_resources   = true
log_retention_in_days         = 50
security_alerts_email_address = "test@microsoft.com"
management_resources_location = "canadacentral"
management_resources_tags = {
  demo_type = "deploy_management_resources_custom"
}
