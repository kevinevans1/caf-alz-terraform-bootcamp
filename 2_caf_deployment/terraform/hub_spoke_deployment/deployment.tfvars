subscription_id_management      = "1e7e8afd-dc7b-4213-9e16-88f1578bf3a3"
subscription_id_identity        = "4eb544cd-3041-4807-a39d-a9c1eab5cc03"
subscription_id_connectivity    = "40871632-b097-4d8d-bbb7-23021eeed17a"
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
security_alerts_email_address = "maximeroy@microsoft.com"
management_resources_location = "canadacentral"
management_resources_tags = {
  demo_type = "deploy_management_resources_custom"
}
