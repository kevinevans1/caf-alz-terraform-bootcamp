output "resource_group" {
  value       = module.bootstrap_resource_group
  description = "Output all the values of the resource group."
}

output "storage_account" {
  value       = module.bootstrap_storage_account
  description = "Output all the values of the storage account."
}
