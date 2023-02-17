variable "enabled" {
  description = "(Optional) Define if the use of the module is enabled or not. Great for test purposes."
  type        = bool
  default     = true
}

variable "storage_account_name" {
  type        = string
  description = "The name of the storage account"
}

variable "resource_group_name" {
  type        = string
  description = "The name of the resource group where the storage account will be created"
}

variable "location" {
  type        = string
  description = "The location where the storage account will be created"
}

variable "account_kind" {
  type        = string
  description = "The kind of storage account, either 'Storage', 'StorageV2', 'BlobStorage', or 'BlockBlobStorage'"
  validation {
    condition     = var.account_kind == "Storage" || var.account_kind == "StorageV2" || var.account_kind == "BlobStorage" || var.account_kind == "BlockBlobStorage" || var.account_kind == "FileStorage"
    error_message = "account_kind must be either 'Storage', 'StorageV2', 'BlobStorage', 'BlockBlobStorage' or 'FileStorage'."
  }
  default = "StorageV2"
}

variable "account_tier" {
  type        = string
  description = "The tier of the storage account, either 'Standard' or 'Premium'"
  validation {
    condition     = var.account_tier == "Standard" || var.account_tier == "Premium"
    error_message = "account_tier must be either 'Standard' or 'Premium'"
  }
  default = "Standard"
}

variable "account_replication_type" {
  type        = string
  description = "The replication type of the storage account, either 'LRS', 'ZRS', 'GRS', 'RAGRS', or 'GZRS'"
  validation {
    condition     = var.account_replication_type == "LRS" || var.account_replication_type == "ZRS" || var.account_replication_type == "GRS" || var.account_replication_type == "RAGRS" || var.account_replication_type == "GZRS"
    error_message = "account_replication_type must be either 'LRS', 'ZRS', 'GRS', 'RAGRS', or 'GZRS'"
  }
  default = "GRS"
}

variable "cross_tenant_replication_enabled" {
  type        = bool
  description = "Whether cross-tenant replication is enabled for the storage account"
  default     = true
}

variable "access_tier" {
  type        = string
  description = "The access tier of the storage account, either 'Hot', or 'Cool'."
  validation {
    condition     = var.access_tier == "Hot" || var.access_tier == "Cool"
    error_message = "access_tier must be either 'Hot' or 'Cool' ."
  }
  default = "Hot"
}

variable "enable_https_traffic_only" {
  type        = bool
  description = "Whether the storage account allows only HTTPS traffic"
  default     = true
}

variable "min_tls_version" {
  type        = string
  description = "The minimum supported TLS version of the storage account, either 'TLS1_0', 'TLS1_1', or 'TLS1_2'"
  validation {
    condition     = var.min_tls_version == "TLS1_0" || var.min_tls_version == "TLS1_1" || var.min_tls_version == "TLS1_2"
    error_message = "min_tls_version must be either 'TLS1_0', 'TLS1_1', or 'TLS1_2'"
  }
  default = "TLS1_2"
}

variable "allow_nested_items_to_be_public" {
  type        = bool
  description = "Whether the storage account allows nested items to be public"
  default     = false
}

variable "shared_access_key_enabled" {
  type        = bool
  description = "Whether the storage account has shared access key enabled"
  default     = true
}

variable "public_network_access_enabled" {
  type        = bool
  description = "Whether the storage account allows public network access"
  default     = false

}

variable "default_to_oauth_authentication" {
  type        = bool
  description = "Whether the storage account defaults to OAuth authentication"
  default     = false
}

variable "is_hns_enabled" {
  type        = bool
  description = "Whether the storage account is enabled for hierarchical namespace"
  default     = false
}

variable "nfsv3_enabled" {
  type        = bool
  description = "Whether the storage account is enabled for NFSv3"
  default     = false
}

variable "large_file_share_enabled" {
  type        = bool
  description = "Whether the storage account is enabled for large file shares"
  default     = false
}

variable "queue_encryption_key_type" {
  type        = string
  description = "The encryption key type for the storage account's queues, either 'Service' or 'Account'"
  validation {
    condition     = var.queue_encryption_key_type == "Service" || var.queue_encryption_key_type == "Account"
    error_message = "queue_encryption_key_type must be either 'Service' or 'Account'"
  }
  default = "Service"
}

variable "table_encryption_key_type" {
  type        = string
  description = "The encryption key type for the storage account's tables, either 'Service' or 'Account'"
  validation {
    condition     = var.table_encryption_key_type == "Service" || var.table_encryption_key_type == "Account"
    error_message = "table_encryption_key_type must be either 'Service' or 'Account'"
  }
  default = "Service"
}

variable "infrastructure_encryption_enabled" {
  type        = bool
  description = "Whether the storage account's infrastructure is encrypted"
  default     = false
}

variable "allowed_copy_scope" {
  type        = string
  description = "The scope of the allowed copy actions on the storage account, either 'AAD' or 'PrivateLink' or null"
  validation {
    condition     = var.allowed_copy_scope == null || var.allowed_copy_scope == "AAD" || var.allowed_copy_scope == "PrivateLink"
    error_message = "allowed_copy_scope must be either 'AAD' or 'PrivateLink' or empty"
  }
  default = null
}

variable "sftp_enabled" {
  type        = bool
  description = "Whether the storage account is enabled for SFTP"
  default     = false
}

variable "enable_custom_domain" {
  type        = bool
  description = "Whether to enable a custom domain for the storage account"
  default     = false
}

variable "custom_domain_name" {
  type        = string
  description = "The custom domain name for the storage account"
  default     = ""
}

variable "custom_domain_name_use_subdomain" {
  type        = bool
  description = "Whether to use a subdomain for the storage account's custom domain"
  default     = false
}

variable "enable_customer_managed_key" {
  type        = bool
  description = "Whether to enable a customer managed key for the storage account"
  default     = false
}

variable "customer_managed_key_key_vault_key_id" {
  type        = string
  description = "The key vault key id for the customer managed key of the storage account"
  default     = null
}

variable "customer_managed_key_user_assigned_identity_id" {
  type        = string
  description = "The user assigned identity id for the customer managed key of the storage account"
  default     = null
}

variable "enable_managed_identity" {
  type        = bool
  description = "Whether to enable a managed identity for the storage account"
  default     = false
}

variable "identity_managed_identity_type" {
  type        = string
  description = "The type of managed identity for the storage account, either 'SystemAssigned' or 'UserAssigned'"
  validation {
    condition     = var.identity_managed_identity_type == "SystemAssigned" || var.identity_managed_identity_type == "UserAssigned"
    error_message = "identity_managed_identity_type must be either 'SystemAssigned' or 'UserAssigned'"
  }
  default = "SystemAssigned"
}

variable "identity_managed_identity_ids" {
  type        = list(string)
  description = "A list of user assigned identity ids for the managed identity of the storage account"
  default     = []
}

variable "enable_network_rules" {
  type        = bool
  default     = true
  description = "Whether to enable network rules for the storage account"
}

variable "network_rules_default_action" {
  type        = string
  description = "The default action for the network rules of the storage account, either 'Allow' or 'Deny'"
  validation {
    condition     = var.network_rules_default_action == "Allow" || var.network_rules_default_action == "Deny"
    error_message = "network_rules_default_action must be either 'Allow' or 'Deny'"
  }
  default = "Deny"
}

variable "network_rules_bypass" {
  type        = list(string)
  description = "A list of bypasses for the network rules of the storage account, either 'AzureServices' or 'Logging' or 'Metrics' or 'None'"
  default     = ["None"]
}

variable "network_rules_ip_rules" {
  type        = list(string)
  default     = []
  description = "List of IP address ranges in CIDR format that should be allowed."
}

variable "network_rules_virtual_network_subnet_ids" {
  type        = list(string)
  default     = []
  description = "List of virtual network subnet IDs that should be allowed."
}
variable "enable_blob_properties" {
  type        = bool
  default     = false
  description = "Enable blob properties for the storage account."
}

variable "blob_properties" {
  type        = map(string)
  default     = {}
  description = "Map of properties related to blob service in the storage account."
}

variable "enable_queue_properties" {
  type        = bool
  default     = false
  description = "Enable queue properties for the storage account."
}

variable "queue_properties" {
  type        = map(string)
  default     = {}
  description = "Map of properties related to queue service in the storage account."
}

variable "enable_static_website" {
  type        = bool
  description = "Enable the configuration for a static website on the storage account."
  default     = false
}

variable "static_website_index_document" {
  type        = string
  description = "The name of the index document for the static website."
  default     = "index.html"
}

variable "static_website_error_404_document" {
  type        = string
  description = "The name of the error 404 document for the static website."
  default     = ""
}

variable "enable_azure_files_authentication" {
  type        = bool
  description = "Enable the configuration for Azure Files Authentication on the storage account."
  default     = false
}

variable "azure_files_authentication_directory_type" {
  type        = string
  description = "The type of directory to be used for Azure Files Authentication. One of 'AD' or 'AAD'."
  default     = ""
  validation {
    condition     = var.azure_files_authentication_directory_type == "" || var.azure_files_authentication_directory_type == "AD" || var.azure_files_authentication_directory_type == "AAD"
    error_message = "azure_files_authentication_directory_type must be either empty, 'AD' or 'AAD'"
  }
}

variable "azure_files_authentication_active_directory_information" {
  type = object({
    storage_sid         = string,
    domain_name         = string,
    domain_sid          = string,
    domain_guid         = string,
    forest_name         = string,
    netbios_domain_name = string
    }
  )
  description = "The active directory information for Azure Files Authentication if AD is set as the directory type."
  default = {
    storage_sid         = "",
    domain_name         = "",
    domain_sid          = "",
    domain_guid         = "",
    forest_name         = "",
    netbios_domain_name = "",
  }
}

variable "enable_custom_routing" {
  type        = bool
  description = "Enable the configuration for custom routing on the storage account."
  default     = false
}

variable "routing_publish_internet_endpoints" {
  type        = bool
  description = "Whether to publish internet endpoints on the storage account."
  default     = false
}

variable "routing_publish_microsoft_endpoints" {
  type        = bool
  description = "Whether to publish Microsoft endpoints on the storage account."
  default     = false
}

variable "routing_choice" {
  type        = string
  description = "The routing choice for the storage account."
  default     = "MicrosoftRouting"
}

variable "blob_containers" {
  type = map(
    object({
      container_access_type = optional(string)
      metadata              = optional(map(string))
      owner                 = optional(string)
      group                 = optional(string)
      ace = optional(list(
        object({
          scope       = string
          type        = string
          id          = string
          permissions = string
      })))
      properties = optional(map(string))
    })
  )
  default     = {}
  description = "A map of blob containers or ADLS Gen 2 Filesystem if hns is enabled that need to be created."
}

variable "file_shares" {
  type = map(
    object({
      quota            = optional(number)
      metadata         = optional(map(string))
      access_tier      = optional(string)
      enabled_protocol = optional(string)
      acl = optional(list(
        object({
          id            = string
          access_policy = optional(map(string))
      })))
      backup = optional(map(string))
    })
  )
  default     = {}
  description = "A map of the file shares that need to be created."
}

variable "queues" {
  type = map(object({
    metadata = optional(map(string))
    })
  )
  default     = {}
  description = "A map of the queues that need to be created."
}

variable "tables" {
  type        = set(string)
  default     = []
  description = "A list of the names of the tables that need to be created."
}

variable "enable_storage_management_policy" {
  type        = bool
  default     = false
  description = "Enables or disables the storage management policy deployment for the storage account"
}

variable "storage_management_policy_rules" {
  type = object({
    name    = optional(string)
    enabled = optional(bool)
    filters = optional(object({
      prefix_match = string
      blob_types   = list(string)
      match_blob_index_tag = object({
        name      = string
        operation = string
        value     = string
      })
    }))
    actions = optional(object({
      base_blob = optional(object({
        tier_to_cool_after_days_since_modification_greater_than        = number
        tier_to_cool_after_days_since_last_access_time_greater_than    = number
        tier_to_archive_after_days_since_modification_greater_than     = number
        tier_to_archive_after_days_since_last_access_time_greater_than = number
        delete_after_days_since_modification_greater_than              = number
        delete_after_days_since_last_access_time_greater_than          = number
      }))
      snapshot = optional(object({
        change_tier_to_archive_after_days_since_creation = number
        change_tier_to_cool_after_days_since_creation    = number
        delete_after_days_since_creation_greater_than    = number
      }))
      version = optional(object({
        change_tier_to_archive_after_days_since_creation = number
        change_tier_to_cool_after_days_since_creation    = number
        delete_after_days_since_creation                 = number
      }))
    }))
  })

  description = "Object with storage management policy rules that will be applied to the storage account. Each rule can have a name, an enabled state, filters, and actions. The filters determine which blobs the rule applies to and the actions determine what will happen to the matching blobs."
  default     = null
}

variable "tags" {
  type        = map(string)
  description = "Tags to be added to the storage account."
  default     = {}
}
