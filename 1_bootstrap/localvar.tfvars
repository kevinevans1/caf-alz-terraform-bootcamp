
bootstrap_resource_group_name     = "testmrtf"
bootstrap_resource_group_location = "canadacentral"
bootstrap_resource_group_tags = {
  ManagedBy = "Terraform"
  Type      = "Bootstrap"
}
bootstrap_storage_account_name = "testmrtf123123"
bootstrap_storage_account_blob_containers = {
  tfstate = {}
}
bootstrap_storage_account_tags = {
  ManagedBy = "Terraform"
  Type      = "Bootstrap"
}
