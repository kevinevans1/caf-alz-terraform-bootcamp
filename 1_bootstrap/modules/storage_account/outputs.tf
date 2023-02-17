output "name" {
  value       = concat(azurerm_storage_account.this[*].name, [""])[0]
  description = "Name of the created storage account"
}

output "id" {
  value       = concat(azurerm_storage_account.this[*].id, [""])[0]
  description = "Id of the created storage account"
}

output "primary_location" {
  value       = concat(azurerm_storage_account.this[*].primary_location, [""])[0]
  description = "Primary location of the created storage account"
}

output "secondary_location" {
  value       = (var.account_replication_type == "GRS" || var.account_replication_type == "GRS-RA") ? concat(azurerm_storage_account.this[*].secondary_location, [""])[0] : null
  description = "Secondary location of the created storage account"
}

output "endpoints" {
  value = concat([{
    primary_location         = concat(azurerm_storage_account.this[*].primary_location, [""])[0]
    secondary_location       = var.account_replication_type == "GRS" || var.account_replication_type == "GRS-RA" ? concat(azurerm_storage_account.this[*].secondary_location, [""])[0] : null
    primary_blob_endpoint    = concat(azurerm_storage_account.this[*].primary_blob_endpoint, [""])[0]
    primary_blob_host        = concat(azurerm_storage_account.this[*].primary_blob_host, [""])[0]
    secondary_blob_endpoint  = var.account_replication_type == "GRS" || var.account_replication_type == "GRS-RA" ? concat(azurerm_storage_account.this[*].secondary_blob_endpoint, [""])[0] : null
    secondary_blob_host      = var.account_replication_type == "GRS" || var.account_replication_type == "GRS-RA" ? concat(azurerm_storage_account.this[*].secondary_blob_host, [""])[0] : null
    primary_queue_endpoint   = concat(azurerm_storage_account.this[*].primary_queue_endpoint, [""])[0]
    primary_queue_host       = concat(azurerm_storage_account.this[*].primary_queue_host, [""])[0]
    secondary_queue_endpoint = var.account_replication_type == "GRS" || var.account_replication_type == "GRS-RA" ? concat(azurerm_storage_account.this[*].secondary_queue_endpoint, [""])[0] : null
    secondary_queue_host     = var.account_replication_type == "GRS" || var.account_replication_type == "GRS-RA" ? concat(azurerm_storage_account.this[*].secondary_queue_host, [""])[0] : null
    primary_table_endpoint   = concat(azurerm_storage_account.this[*].primary_table_endpoint, [""])[0]
    primary_table_host       = concat(azurerm_storage_account.this[*].primary_table_host, [""])[0]
    secondary_table_endpoint = var.account_replication_type == "GRS" || var.account_replication_type == "GRS-RA" ? concat(azurerm_storage_account.this[*].secondary_table_endpoint, [""])[0] : null
    secondary_table_host     = var.account_replication_type == "GRS" || var.account_replication_type == "GRS-RA" ? concat(azurerm_storage_account.this[*].secondary_table_host, [""])[0] : null
    primary_file_endpoint    = concat(azurerm_storage_account.this[*].primary_file_endpoint, [""])[0]
    primary_file_host        = concat(azurerm_storage_account.this[*].primary_file_host, [""])[0]
    secondary_file_endpoint  = var.account_replication_type == "GRS" || var.account_replication_type == "GRS-RA" ? concat(azurerm_storage_account.this[*].secondary_file_endpoint, [""])[0] : null
    secondary_file_host      = var.account_replication_type == "GRS" || var.account_replication_type == "GRS-RA" ? concat(azurerm_storage_account.this[*].secondary_file_host, [""])[0] : null
    primary_dfs_endpoint     = concat(azurerm_storage_account.this[*].primary_dfs_endpoint, [""])[0]
    primary_dfs_host         = concat(azurerm_storage_account.this[*].primary_dfs_host, [""])[0]
    secondary_dfs_endpoint   = var.account_replication_type == "GRS" || var.account_replication_type == "GRS-RA" ? concat(azurerm_storage_account.this[*].secondary_dfs_endpoint, [""])[0] : null
    secondary_dfs_host       = var.account_replication_type == "GRS" || var.account_replication_type == "GRS-RA" ? concat(azurerm_storage_account.this[*].secondary_dfs_host, [""])[0] : null
    primary_web_endpoint     = concat(azurerm_storage_account.this[*].primary_web_endpoint, [""])[0]
    primary_web_host         = concat(azurerm_storage_account.this[*].primary_web_host, [""])[0]
    secondary_web_endpoint   = var.account_replication_type == "GRS" || var.account_replication_type == "GRS-RA" ? concat(azurerm_storage_account.this[*].secondary_web_endpoint, [""])[0] : null
    secondary_web_host       = var.account_replication_type == "GRS" || var.account_replication_type == "GRS-RA" ? concat(azurerm_storage_account.this[*].secondary_web_host, [""])[0] : null
  }], [{}])[0]
  description = "Endpoints of the storage account"
}

output "primary_access_key" {
  value       = concat(azurerm_storage_account.this[*].primary_access_key, [""])[0]
  sensitive   = true
  description = "(Sensitive) Primary access key of the storage account"
}

output "secondary_access_key" {
  value       = concat(azurerm_storage_account.this[*].secondary_access_key, [""])[0]
  sensitive   = true
  description = "(Sensitive) Secondary access key of the storage account"
}

output "primary_connection_string" {
  value       = concat(azurerm_storage_account.this[*].primary_connection_string, [""])[0]
  sensitive   = true
  description = "(Sensitive) Primary connection string of the storage account"
}

output "secondary_connection_string" {
  value       = concat(azurerm_storage_account.this[*].secondary_connection_string, [""])[0]
  sensitive   = true
  description = "(Sensitive) Secondary connection string of the storage account"
}

output "primary_blob_connection_string" {
  value       = concat(azurerm_storage_account.this[*].primary_blob_connection_string, [""])[0]
  sensitive   = true
  description = "(Sensitive) Primary blob connection string of the storage account"
}

output "secondary_blob_connection_string" {
  value       = concat(azurerm_storage_account.this[*].secondary_blob_connection_string, [""])[0]
  sensitive   = true
  description = "(Sensitive) Secondary blob connection string of the storage account"
}

output "identity" {
  value       = concat(azurerm_storage_account.this[*].identity, [""])[0]
  description = "Identities linked to the storage account"
}

# output "blob_containers" {
#   value       = var.enabled && var.is_hns_enabled == false && var.blob_containers != {} ? concat(azurerm_storage_container.this[*], [""])[0] : null
#   description = "List of map of attributes generated by the non-ADLSGen 2 blob containers containing the id, the resource_manager_id, the has_immutability_policy flag and the has_legal_hold flag."
# }
# output "file_shares" {
#   value       = var.enabled && var.file_shares != {} ? concat(azurerm_storage_share.this[*], [""])[0] : null
#   description = "List of map of attributes generated by the file shares containing the id, resource_manager_id and url."
# }

# output "adls_gen2_filesystem" {
#   value       = var.enabled && var.is_hns_enabled == true && var.blob_containers != {} ? concat(azurerm_storage_data_lake_gen2_filesystem.this[*], [""])[0] : null
#   description = "List of the created ADLS Gen2 filesystems."
# }

output "blob_containers" {
  value       = local.output_blob_containers
  description = "List of map of attributes generated by the non-ADLSGen 2 blob containers."
}

output "file_shares" {
  value       = local.output_file_shares
  description = "List of map of attributes generated by the file shares."
}

output "backup_file_shares" {
  value       = var.enabled && local.backup_enabled_file_shares != {} ? concat(azurerm_backup_protected_file_share.this[*], [""])[0] : null
  description = "List of the backup file share."
}

output "queues" {
  value       = local.output_queues
  description = "List of map of attributes generated by the queues."
}

output "tables" {
  value       = local.output_tables
  description = "List of map of attributes generated by the tables."
}

# output "queues_ids" {
#   value       = var.enabled && var.queues != {} ? concat(azurerm_storage_queue.this[*], [""])[0] : null
#   description = "List of ids of the queues created."
# }

# output "tables_ids" {
#   value       = var.enabled && length(var.tables) > 0 ? concat(azurerm_storage_table.this[*], [""])[0] : null
#   description = "List of ids of the tables created."
# }

# output "storage_management_policy_id" {
#   value       = var.enabled && var.enable_storage_management_policy ? concat(azurerm_storage_management_policy.this[*], [""])[0] : null
#   description = "Id of the storage management policy created."
# }
