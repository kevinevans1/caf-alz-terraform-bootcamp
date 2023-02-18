#tfsec:ignore:allow-microsoft-service-bypass
resource "azurerm_storage_account" "this" {
  count                            = var.enabled ? 1 : 0
  name                             = var.storage_account_name
  resource_group_name              = var.resource_group_name
  location                         = var.location
  account_kind                     = var.account_kind
  account_tier                     = var.account_tier
  account_replication_type         = var.account_replication_type
  cross_tenant_replication_enabled = var.cross_tenant_replication_enabled
  access_tier                      = var.access_tier
  #edge_zone                         = var.edge_zone
  enable_https_traffic_only         = var.enable_https_traffic_only
  min_tls_version                   = var.min_tls_version
  allow_nested_items_to_be_public   = var.allow_nested_items_to_be_public
  shared_access_key_enabled         = var.shared_access_key_enabled
  public_network_access_enabled     = var.public_network_access_enabled
  default_to_oauth_authentication   = var.default_to_oauth_authentication
  is_hns_enabled                    = (var.account_tier == "Standard" || (var.account_tier == "Premium" && var.account_kind == "BlockBlobStorage")) ? var.is_hns_enabled : false
  nfsv3_enabled                     = ((var.account_tier == "Standard" && var.account_kind == "StorageV2") || (var.account_tier == "Premium" && var.account_kind == "BlockBlobStorage")) && var.is_hns_enabled == true && var.enable_https_traffic_only == false ? var.nfsv3_enabled : null
  large_file_share_enabled          = var.large_file_share_enabled
  queue_encryption_key_type         = var.account_kind == "StorageV2" ? var.queue_encryption_key_type : null
  table_encryption_key_type         = var.account_kind == "StorageV2" ? var.table_encryption_key_type : null
  infrastructure_encryption_enabled = var.account_kind == "StorageV2" || var.account_tier == "Premium" && var.account_kind == "BlockBlobStorage" ? var.infrastructure_encryption_enabled : null
  allowed_copy_scope                = var.allowed_copy_scope
  sftp_enabled                      = var.is_hns_enabled == true ? var.sftp_enabled : null

  dynamic "custom_domain" {
    for_each = var.enable_custom_domain ? [1] : [0]
    content {
      name          = var.custom_domain_name
      use_subdomain = var.custom_domain_name_use_subdomain
    }
  }

  dynamic "customer_managed_key" {
    for_each = var.enable_customer_managed_key && (var.account_kind == "StorageV2" || var.account_tier == "Premium" && var.identity_managed_identity_type == "UserAssigned") ? [1] : []
    content {
      key_vault_key_id          = try(var.customer_managed_key_key_vault_key_id, null)
      user_assigned_identity_id = try(var.customer_managed_key_user_assigned_identity_id, null)
    }
  }

  dynamic "identity" {
    for_each = var.enable_managed_identity ? [1] : []
    content {
      type         = var.identity_managed_identity_type
      identity_ids = var.identity_managed_identity_type == "UserAssigned" ? var.identity_managed_identity_ids : []
    }
  }
  dynamic "network_rules" {
    for_each = var.enable_network_rules ? [1] : []
    content {
      default_action             = try(var.network_rules_default_action, "Deny")
      bypass                     = var.network_rules_default_action == "Deny" ? try(var.network_rules_bypass, ["None"]) : ["None"]
      ip_rules                   = var.network_rules_default_action == "Deny" ? try(var.network_rules_ip_rules, []) : []
      virtual_network_subnet_ids = var.network_rules_default_action == "Deny" ? try(var.network_rules_virtual_network_subnet_ids, []) : []
    }
  }

  dynamic "blob_properties" {
    for_each = var.enable_blob_properties && var.blob_properties != {} ? [1] : []

    content {
      versioning_enabled       = try(var.blob_properties.versioning_enabled, false)
      change_feed_enabled      = try(var.blob_properties.change_feed_enabled, false)
      default_service_version  = try(var.blob_properties.default_service_version, "2020-06-12")
      last_access_time_enabled = try(var.blob_properties.last_access_time_enabled, false)

      dynamic "cors_rule" {
        for_each = lookup(var.blob_properties, "cors_rule", false) && var.blob_properties.cors_rule != {} ? [1] : []

        content {
          allowed_headers    = var.blob_properties.cors_rule.allowed_headers
          allowed_methods    = var.blob_properties.cors_rule.allowed_methods
          allowed_origins    = var.blob_properties.cors_rule.allowed_origins
          exposed_headers    = var.blob_properties.cors_rule.exposed_headers
          max_age_in_seconds = var.blob_properties.cors_rule.max_age_in_seconds
        }
      }

      dynamic "delete_retention_policy" {
        for_each = lookup(var.blob_properties, "delete_retention_policy", false) ? [1] : []

        content {
          days = try(var.blob_properties.delete_retention_policy.days, 7)
        }
      }

      dynamic "container_delete_retention_policy" {
        for_each = lookup(var.blob_properties, "container_delete_retention_policy", false) ? [1] : []

        content {
          days = try(var.blob_properties.container_delete_retention_policy.days, 7)
        }
      }
    }
  }

  dynamic "queue_properties" {
    for_each = var.enable_queue_properties && var.queue_properties != {} && var.account_kind != "BlobStorage" ? [1] : []

    content {
      dynamic "cors_rule" {
        for_each = lookup(var.queue_properties, "cors_rule", false) ? [1] : []

        content {
          allowed_headers    = var.queue_properties.cors_rule.allowed_headers
          allowed_methods    = var.queue_properties.cors_rule.allowed_methods
          allowed_origins    = var.queue_properties.cors_rule.allowed_origins
          exposed_headers    = var.queue_properties.cors_rule.exposed_headers
          max_age_in_seconds = var.queue_properties.cors_rule.max_age_in_seconds
        }
      }

      dynamic "logging" {
        for_each = lookup(var.queue_properties, "logging", false) ? [1] : []

        content {
          delete                = var.queue_properties.logging.delete
          read                  = var.queue_properties.logging.read
          write                 = var.queue_properties.logging.write
          version               = var.queue_properties.logging.version
          retention_policy_days = try(var.queue_properties.logging.retention_policy_days, 7)
        }
      }

      dynamic "minute_metrics" {
        for_each = lookup(var.queue_properties, "minute_metrics", false) ? [1] : []

        content {
          enabled               = var.queue_properties.minute_metrics.enabled
          version               = var.queue_properties.minute_metrics.version
          include_apis          = try(var.queue_properties.minute_metrics.include_apis, null)
          retention_policy_days = try(var.queue_properties.minute_metrics.retention_policy_days, 7)
        }
      }

      dynamic "hour_metrics" {
        for_each = lookup(var.queue_properties, "hour_metrics", false) ? [1] : []

        content {
          enabled               = var.queue_properties.hour_metrics.enabled
          version               = var.queue_properties.hour_metrics.version
          include_apis          = try(var.queue_properties.hour_metrics.include_apis, null)
          retention_policy_days = try(var.queue_properties.hour_metrics.retention_policy_days, 7)
        }
      }
    }
  }

  dynamic "static_website" {
    for_each = var.enable_static_website && (var.account_kind == "StorageV2" || var.account_kind == "BlockBlobStorage") ? [1] : []

    content {
      index_document     = var.static_website_index_document
      error_404_document = try(var.static_website_error_404_document, null)
    }
  }

  dynamic "azure_files_authentication" {
    for_each = var.enable_azure_files_authentication ? [1] : []

    content {
      directory_type = var.azure_files_authentication_directory_type
      dynamic "active_directory" {
        for_each = var.azure_files_authentication_directory_type == "AD" ? [1] : []
        content {
          storage_sid         = var.azure_files_authentication_active_directory_information.storage_sid
          domain_name         = var.azure_files_authentication_active_directory_information.domain_name
          domain_sid          = var.azure_files_authentication_active_directory_information.domain_sid
          domain_guid         = var.azure_files_authentication_active_directory_information.domain_guid
          forest_name         = var.azure_files_authentication_active_directory_information.forest_name
          netbios_domain_name = var.azure_files_authentication_active_directory_information.netbios_domain_name
        }
      }
    }
  }

  dynamic "routing" {
    for_each = var.enable_custom_routing ? [1] : []

    content {
      publish_internet_endpoints  = try(var.routing_publish_internet_endpoints, false)
      publish_microsoft_endpoints = try(var.routing_publish_microsoft_endpoints, false)
      choice                      = try(var.routing_choice, "MicrosoftRouting")
    }
  }

  tags = var.tags
}

# resource "time_sleep" "this" {
#   create_duration = "15s"
#   depends_on = [
#     azurerm_storage_account.this
#   ]
# }

#Not directly using storage_containers due to https://github.com/hashicorp/terraform-provider-azurerm/issues/2977

# resource "azurerm_storage_container" "this" {
#   for_each = var.enabled && var.is_hns_enabled == false && var.blob_containers != {} ? var.blob_containers : {}

#   name                  = each.key
#   storage_account_name  = try(azurerm_storage_account.this[0].name, null)
#   container_access_type = try(each.value.name.container_access_type, "private")
#   metadata              = try(each.value.name.metadata, null)
#   depends_on = [
#     time_sleep.this
#   ]
# }

resource "azapi_resource" "this_blob_containers" {
  for_each = var.enabled && var.blob_containers != {} ? var.blob_containers : {}
  #for_each = var.enabled && var.is_hns_enabled == false && var.blob_containers != {} ? var.blob_containers : {}

  name      = each.key
  parent_id = try("${azurerm_storage_account.this[0].id}/blobServices/default", null)
  type      = "Microsoft.Storage/storageAccounts/blobServices/containers@2022-09-01"
  body = jsonencode({
    properties = {
      publicAccess = try(each.value.name.container_access_type, "None")
      metadata     = try(each.value.name.metadata, null)
    }
  })
  response_export_values = ["*"]
}

#Use only with an local cicd agent and private endpoint or fw rule due to https://github.com/hashicorp/terraform-provider-azurerm/issues/2977
# resource "azurerm_storage_data_lake_gen2_filesystem" "this" {
#   for_each = var.enabled && var.is_hns_enabled == true && var.blob_containers != {} ? var.blob_containers : {}

#   name               = each.key
#   storage_account_id = try(azurerm_storage_account.this[0].id, null)
#   owner              = try(each.value.owner, "$superuser")
#   group              = try(each.value.group, "$superuser")
#   dynamic "ace" {
#     for_each = each.value.ace != null ? toset(each.value.ace) : []
#     content {
#       scope       = try(ace.scope, "access")
#       type        = try(ace.type, "mask")
#       id          = (ace.type == "user" || ace.type == "group") ? ace.id : null
#       permissions = try(ace.permissions, "r--")
#     }
#   }
#   properties = each.value.properties != null ? {
#     for key, value in try(each.value.properties, {}) : key => base64encode(value)
#   } : null
# }
#Not directly using file_shares due to https://github.com/hashicorp/terraform-provider-azurerm/issues/2977

# resource "azurerm_storage_share" "this" {
#   for_each = var.enabled && var.file_shares != {} ? var.file_shares : {}

#   name                 = each.key
#   storage_account_name = try(azurerm_storage_account.this[0].name, null)
#   quota                = try(each.value.quota, null)
#   metadata             = try(each.value.metadata, null)
#   enabled_protocol     = try(each.value.enabled_protocol, null)

#   dynamic "acl" {
#     for_each = try(each.value.acl, null) != null ? [each.value.acl] : []
#     content {
#       id = acl.value.id

#       dynamic "access_policy" {
#         for_each = try(acl.value.access_policy, null) != null ? [acl.value.access_policy] : []
#         content {
#           permissions = access_policy.value.permissions
#           start       = try(access_policy.value.start, null)
#           expiry      = try(access_policy.value.expiry, null)
#         }
#       }
#     }
#   }
#   depends_on = [
#     time_sleep.this
#   ]
# }

resource "azapi_resource" "this_file_shares" {
  for_each  = var.enabled && var.file_shares != {} ? var.file_shares : {}
  type      = "Microsoft.Storage/storageAccounts/fileServices/shares@2022-05-01"
  name      = each.key
  parent_id = try("${azurerm_storage_account.this[0].id}/fileServices/default", null)
  body = jsonencode({
    properties = {
      enabledProtocols = try(each.value.enabled_protocol, null)
      metadata         = try(each.value.metadata, null)
      shareQuota       = try(each.value.quota, null)
    }
  })
  response_export_values = ["*"]
}

resource "azurerm_backup_protected_file_share" "this" {
  for_each = var.enabled && local.backup_enabled_file_shares != {} ? local.backup_enabled_file_shares : {}

  resource_group_name       = try(each.value.recovery_vault_resource_group_name, null)
  recovery_vault_name       = try(each.value.recovery_vault_name, null)
  source_storage_account_id = try(azurerm_storage_account.this[0].id, null)
  source_file_share_name    = each.value
  backup_policy_id          = try(each.value.backup_policy_id, null)
  depends_on = [
    azapi_resource.this_file_shares
  ]
}

resource "azapi_resource" "this_queues" {
  for_each  = var.enabled && var.queues != {} ? var.queues : {}
  type      = "Microsoft.Storage/storageAccounts/queueServices/queues@2022-05-01"
  name      = each.key
  parent_id = try("${azurerm_storage_account.this[0].id}/queueServices/default", null)
  body = jsonencode({
    properties = {
      metadata = try(each.value.metadata, null)
    }
  })
  response_export_values = ["*"]
}

resource "azapi_resource" "this_tables" {
  for_each               = var.enabled && length(var.tables) > 0 ? toset(var.tables) : []
  type                   = "Microsoft.Storage/storageAccounts/tableServices/tables@2022-05-01"
  name                   = each.key
  parent_id              = try("${azurerm_storage_account.this[0].id}/tableServices/default", null)
  body                   = jsonencode({})
  response_export_values = ["*"]
}

# resource "azurerm_storage_queue" "this" {
#   for_each = var.enabled && var.queues != {} ? var.queues : {}

#   name                 = each.key
#   storage_account_name = try(azurerm_storage_account.this[0].name, null)
#   metadata             = try(each.value.metadata, null)
#   depends_on = [
#     time_sleep.this
#   ]
# }

# resource "azurerm_storage_table" "this" {
#   for_each             = var.enabled && length(var.tables) > 0 ? toset(var.tables) : []
#   name                 = each.key
#   storage_account_name = try(azurerm_storage_account.this[0].name, null)
#   depends_on = [
#     time_sleep.this
#   ]
# }

# resource "azurerm_storage_management_policy" "this" {
#   count = var.enabled && var.enable_storage_management_policy && var.storage_management_policy_rules != null ? 1 : 0

#   storage_account_id = try(azurerm_storage_account.this[0].id, null)
#   dynamic "rule" {
#     for_each = var.enabled && var.enable_storage_management_policy ? var.storage_management_policy_rules : null

#     content {
#       name    = try(rule.name, null)
#       enabled = try(rule.enabled, null)

#       dynamic "filters" {
#         for_each = try(rule.filters, {})

#         content {
#           prefix_match = try(filters.value.prefix_match, null)
#           blob_types   = try(filters.value.blob_types, null)

#           dynamic "match_blob_index_tag" {
#             for_each = try(filters.match_blob_index_tag, {})

#             content {
#               name      = try(match_blob_index_tag.value.name, null)
#               operation = try(match_blob_index_tag.value.operation, null)
#               value     = try(match_blob_index_tag.value.value, null)
#             }
#           }
#         }

#       }
#       actions {
#         dynamic "base_blob" {
#           for_each = try(rule.actions.base_blob, {})

#           content {
#             tier_to_cool_after_days_since_modification_greater_than        = try(base_blob.value.tier_to_cool_after_days_since_modification_greater_than, null)
#             tier_to_cool_after_days_since_last_access_time_greater_than    = try(base_blob.value.tier_to_cool_after_days_since_last_access_time_greater_than, null)
#             tier_to_archive_after_days_since_modification_greater_than     = try(base_blob.value.tier_to_archive_after_days_since_modification_greater_than, null)
#             tier_to_archive_after_days_since_last_access_time_greater_than = try(base_blob.value.tier_to_archive_after_days_since_last_access_time_greater_than, null)
#             delete_after_days_since_modification_greater_than              = try(base_blob.value.delete_after_days_since_modification_greater_than, null)
#             delete_after_days_since_last_access_time_greater_than          = try(base_blob.value.delete_after_days_since_last_access_time_greater_than, null)
#           }
#         }

#         dynamic "snapshot" {
#           for_each = try(rule.actions.snapshot, {})

#           content {
#             change_tier_to_archive_after_days_since_creation = try(snapshot.value.change_tier_to_archive_after_days_since_creation, null)
#             change_tier_to_cool_after_days_since_creation    = try(snapshot.value.change_tier_to_cool_after_days_since_creation, null)
#             delete_after_days_since_creation_greater_than    = try(snapshot.value.delete_after_days_since_creation_greater_than, null)
#           }
#         }

#         dynamic "version" {
#           for_each = try(rule.actions.version, {})

#           content {
#             change_tier_to_archive_after_days_since_creation = try(version.value.change_tier_to_archive_after_days_since_creation, null)
#             change_tier_to_cool_after_days_since_creation    = try(version.value.change_tier_to_cool_after_days_since_creation, null)
#             delete_after_days_since_creation                 = try(version.value.delete_after_days_since_creation, null)
#           }
#         }
#       }
#     }
#   }
# }
#To Do
#Encryption scope when not in preview
