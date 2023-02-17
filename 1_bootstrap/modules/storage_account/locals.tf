locals {
  backup_enabled_file_shares = { for file_share in var.file_shares : file_share.name => file_share if file_share.backup != null }
  output_blob_containers     = var.enabled && var.is_hns_enabled == false && var.blob_containers != {} ? { for container in keys(var.blob_containers) : container => jsondecode(azapi_resource.this_blob_containers[container].output) } : null
  output_file_shares         = var.enabled && var.is_hns_enabled == false && var.file_shares != {} ? { for share in keys(var.file_shares) : share => jsondecode(azapi_resource.this_file_shares[share].output) } : null
  output_queues              = var.enabled && var.queues != {} ? { for queue in keys(var.queues) : queue => jsondecode(azapi_resource.this_queues[queue].output) } : null
  output_tables              = var.enabled && length(var.tables) > 0 ? { for table in var.tables : table => jsondecode(azapi_resource.this_tables[table].output) } : null
}
