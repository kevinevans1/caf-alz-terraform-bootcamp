module "bootstrap_resource_group" {
  source   = "../modules/resource_group"
  name     = var.bootstrap_resource_group_name
  location = var.bootstrap_resource_group_location
  tags     = var.bootstrap_resource_group_tags
}

module "bootstrap_role_assignment_storage_blob_data_owner" {
  source               = "../modules/role_assignment"
  scope                = module.bootstrap_resource_group.id
  role_definition_name = "Storage Blob Data Owner"
  principal_id         = data.azurerm_client_config.current.object_id
}

module "bootstrap_storage_account" {
  source                       = "../modules/storage_account"
  storage_account_name         = var.bootstrap_storage_account_name
  resource_group_name          = module.bootstrap_resource_group.name
  location                     = module.bootstrap_resource_group.location
  blob_containers = var.bootstrap_storage_account_blob_containers
  tags= var.bootstrap_storage_account_tags
}
