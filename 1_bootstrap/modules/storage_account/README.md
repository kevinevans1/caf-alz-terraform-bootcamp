# terraform-azurerm-module-storage-account
## Introduction

Terraform module used to deploy a storage account.

## Build and Test

TBD
## Module

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
### Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.7 |
| <a name="requirement_azapi"></a> [azapi](#requirement\_azapi) | >= 1.2.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 3.39.0 |

### Providers

| Name | Version |
|------|---------|
| <a name="provider_azapi"></a> [azapi](#provider\_azapi) | 1.3.0 |
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.44.1 |

### Modules

No modules.

### Resources

| Name | Type |
|------|------|
| [azapi_resource.this_blob_containers](https://registry.terraform.io/providers/azure/azapi/latest/docs/resources/resource) | resource |
| [azapi_resource.this_file_shares](https://registry.terraform.io/providers/azure/azapi/latest/docs/resources/resource) | resource |
| [azapi_resource.this_queues](https://registry.terraform.io/providers/azure/azapi/latest/docs/resources/resource) | resource |
| [azapi_resource.this_tables](https://registry.terraform.io/providers/azure/azapi/latest/docs/resources/resource) | resource |
| [azurerm_backup_protected_file_share.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/backup_protected_file_share) | resource |
| [azurerm_storage_account.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account) | resource |

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_access_tier"></a> [access\_tier](#input\_access\_tier) | The access tier of the storage account, either 'Hot', or 'Cool'. | `string` | `"Hot"` | no |
| <a name="input_account_kind"></a> [account\_kind](#input\_account\_kind) | The kind of storage account, either 'Storage', 'StorageV2', 'BlobStorage', or 'BlockBlobStorage' | `string` | `"StorageV2"` | no |
| <a name="input_account_replication_type"></a> [account\_replication\_type](#input\_account\_replication\_type) | The replication type of the storage account, either 'LRS', 'ZRS', 'GRS', 'RAGRS', or 'GZRS' | `string` | `"GRS"` | no |
| <a name="input_account_tier"></a> [account\_tier](#input\_account\_tier) | The tier of the storage account, either 'Standard' or 'Premium' | `string` | `"Standard"` | no |
| <a name="input_allow_nested_items_to_be_public"></a> [allow\_nested\_items\_to\_be\_public](#input\_allow\_nested\_items\_to\_be\_public) | Whether the storage account allows nested items to be public | `bool` | `false` | no |
| <a name="input_allowed_copy_scope"></a> [allowed\_copy\_scope](#input\_allowed\_copy\_scope) | The scope of the allowed copy actions on the storage account, either 'AAD' or 'PrivateLink' or null | `string` | `null` | no |
| <a name="input_azure_files_authentication_active_directory_information"></a> [azure\_files\_authentication\_active\_directory\_information](#input\_azure\_files\_authentication\_active\_directory\_information) | The active directory information for Azure Files Authentication if AD is set as the directory type. | <pre>object({<br>    storage_sid         = string,<br>    domain_name         = string,<br>    domain_sid          = string,<br>    domain_guid         = string,<br>    forest_name         = string,<br>    netbios_domain_name = string<br>    }<br>  )</pre> | <pre>{<br>  "domain_guid": "",<br>  "domain_name": "",<br>  "domain_sid": "",<br>  "forest_name": "",<br>  "netbios_domain_name": "",<br>  "storage_sid": ""<br>}</pre> | no |
| <a name="input_azure_files_authentication_directory_type"></a> [azure\_files\_authentication\_directory\_type](#input\_azure\_files\_authentication\_directory\_type) | The type of directory to be used for Azure Files Authentication. One of 'AD' or 'AAD'. | `string` | `""` | no |
| <a name="input_blob_containers"></a> [blob\_containers](#input\_blob\_containers) | A map of blob containers or ADLS Gen 2 Filesystem if hns is enabled that need to be created. | <pre>map(<br>    object({<br>      container_access_type = optional(string)<br>      metadata              = optional(map(string))<br>      owner                 = optional(string)<br>      group                 = optional(string)<br>      ace = optional(list(<br>        object({<br>          scope       = string<br>          type        = string<br>          id          = string<br>          permissions = string<br>      })))<br>      properties = optional(map(string))<br>    })<br>  )</pre> | `{}` | no |
| <a name="input_blob_properties"></a> [blob\_properties](#input\_blob\_properties) | Map of properties related to blob service in the storage account. | `map(string)` | `{}` | no |
| <a name="input_cross_tenant_replication_enabled"></a> [cross\_tenant\_replication\_enabled](#input\_cross\_tenant\_replication\_enabled) | Whether cross-tenant replication is enabled for the storage account | `bool` | `true` | no |
| <a name="input_custom_domain_name"></a> [custom\_domain\_name](#input\_custom\_domain\_name) | The custom domain name for the storage account | `string` | `""` | no |
| <a name="input_custom_domain_name_use_subdomain"></a> [custom\_domain\_name\_use\_subdomain](#input\_custom\_domain\_name\_use\_subdomain) | Whether to use a subdomain for the storage account's custom domain | `bool` | `false` | no |
| <a name="input_customer_managed_key_key_vault_key_id"></a> [customer\_managed\_key\_key\_vault\_key\_id](#input\_customer\_managed\_key\_key\_vault\_key\_id) | The key vault key id for the customer managed key of the storage account | `string` | `null` | no |
| <a name="input_customer_managed_key_user_assigned_identity_id"></a> [customer\_managed\_key\_user\_assigned\_identity\_id](#input\_customer\_managed\_key\_user\_assigned\_identity\_id) | The user assigned identity id for the customer managed key of the storage account | `string` | `null` | no |
| <a name="input_default_to_oauth_authentication"></a> [default\_to\_oauth\_authentication](#input\_default\_to\_oauth\_authentication) | Whether the storage account defaults to OAuth authentication | `bool` | `false` | no |
| <a name="input_enable_azure_files_authentication"></a> [enable\_azure\_files\_authentication](#input\_enable\_azure\_files\_authentication) | Enable the configuration for Azure Files Authentication on the storage account. | `bool` | `false` | no |
| <a name="input_enable_blob_properties"></a> [enable\_blob\_properties](#input\_enable\_blob\_properties) | Enable blob properties for the storage account. | `bool` | `false` | no |
| <a name="input_enable_custom_domain"></a> [enable\_custom\_domain](#input\_enable\_custom\_domain) | Whether to enable a custom domain for the storage account | `bool` | `false` | no |
| <a name="input_enable_custom_routing"></a> [enable\_custom\_routing](#input\_enable\_custom\_routing) | Enable the configuration for custom routing on the storage account. | `bool` | `false` | no |
| <a name="input_enable_customer_managed_key"></a> [enable\_customer\_managed\_key](#input\_enable\_customer\_managed\_key) | Whether to enable a customer managed key for the storage account | `bool` | `false` | no |
| <a name="input_enable_https_traffic_only"></a> [enable\_https\_traffic\_only](#input\_enable\_https\_traffic\_only) | Whether the storage account allows only HTTPS traffic | `bool` | `true` | no |
| <a name="input_enable_managed_identity"></a> [enable\_managed\_identity](#input\_enable\_managed\_identity) | Whether to enable a managed identity for the storage account | `bool` | `false` | no |
| <a name="input_enable_network_rules"></a> [enable\_network\_rules](#input\_enable\_network\_rules) | Whether to enable network rules for the storage account | `bool` | `true` | no |
| <a name="input_enable_queue_properties"></a> [enable\_queue\_properties](#input\_enable\_queue\_properties) | Enable queue properties for the storage account. | `bool` | `false` | no |
| <a name="input_enable_static_website"></a> [enable\_static\_website](#input\_enable\_static\_website) | Enable the configuration for a static website on the storage account. | `bool` | `false` | no |
| <a name="input_enabled"></a> [enabled](#input\_enabled) | (Optional) Define if the use of the module is enabled or not. Great for test purposes. | `bool` | `true` | no |
| <a name="input_file_shares"></a> [file\_shares](#input\_file\_shares) | A map of the file shares that need to be created. | <pre>map(<br>    object({<br>      quota            = optional(number)<br>      metadata         = optional(map(string))<br>      access_tier      = optional(string)<br>      enabled_protocol = optional(string)<br>      acl = optional(list(<br>        object({<br>          id            = string<br>          access_policy = optional(map(string))<br>      })))<br>      backup = optional(map(string))<br>    })<br>  )</pre> | `{}` | no |
| <a name="input_identity_managed_identity_ids"></a> [identity\_managed\_identity\_ids](#input\_identity\_managed\_identity\_ids) | A list of user assigned identity ids for the managed identity of the storage account | `list(string)` | `[]` | no |
| <a name="input_identity_managed_identity_type"></a> [identity\_managed\_identity\_type](#input\_identity\_managed\_identity\_type) | The type of managed identity for the storage account, either 'SystemAssigned' or 'UserAssigned' | `string` | `"SystemAssigned"` | no |
| <a name="input_infrastructure_encryption_enabled"></a> [infrastructure\_encryption\_enabled](#input\_infrastructure\_encryption\_enabled) | Whether the storage account's infrastructure is encrypted | `bool` | `false` | no |
| <a name="input_is_hns_enabled"></a> [is\_hns\_enabled](#input\_is\_hns\_enabled) | Whether the storage account is enabled for hierarchical namespace | `bool` | `false` | no |
| <a name="input_large_file_share_enabled"></a> [large\_file\_share\_enabled](#input\_large\_file\_share\_enabled) | Whether the storage account is enabled for large file shares | `bool` | `false` | no |
| <a name="input_location"></a> [location](#input\_location) | The location where the storage account will be created | `string` | n/a | yes |
| <a name="input_min_tls_version"></a> [min\_tls\_version](#input\_min\_tls\_version) | The minimum supported TLS version of the storage account, either 'TLS1\_0', 'TLS1\_1', or 'TLS1\_2' | `string` | `"TLS1_2"` | no |
| <a name="input_network_rules_bypass"></a> [network\_rules\_bypass](#input\_network\_rules\_bypass) | A list of bypasses for the network rules of the storage account, either 'AzureServices' or 'Logging' or 'Metrics' or 'None' | `list(string)` | <pre>[<br>  "None"<br>]</pre> | no |
| <a name="input_network_rules_default_action"></a> [network\_rules\_default\_action](#input\_network\_rules\_default\_action) | The default action for the network rules of the storage account, either 'Allow' or 'Deny' | `string` | `"Deny"` | no |
| <a name="input_network_rules_ip_rules"></a> [network\_rules\_ip\_rules](#input\_network\_rules\_ip\_rules) | List of IP address ranges in CIDR format that should be allowed. | `list(string)` | `[]` | no |
| <a name="input_network_rules_virtual_network_subnet_ids"></a> [network\_rules\_virtual\_network\_subnet\_ids](#input\_network\_rules\_virtual\_network\_subnet\_ids) | List of virtual network subnet IDs that should be allowed. | `list(string)` | `[]` | no |
| <a name="input_nfsv3_enabled"></a> [nfsv3\_enabled](#input\_nfsv3\_enabled) | Whether the storage account is enabled for NFSv3 | `bool` | `false` | no |
| <a name="input_public_network_access_enabled"></a> [public\_network\_access\_enabled](#input\_public\_network\_access\_enabled) | Whether the storage account allows public network access | `bool` | `false` | no |
| <a name="input_queue_encryption_key_type"></a> [queue\_encryption\_key\_type](#input\_queue\_encryption\_key\_type) | The encryption key type for the storage account's queues, either 'Service' or 'Account' | `string` | `"Service"` | no |
| <a name="input_queue_properties"></a> [queue\_properties](#input\_queue\_properties) | Map of properties related to queue service in the storage account. | `map(string)` | `{}` | no |
| <a name="input_queues"></a> [queues](#input\_queues) | A map of the queues that need to be created. | <pre>map(object({<br>    metadata = optional(map(string))<br>    })<br>  )</pre> | `{}` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group where the storage account will be created | `string` | n/a | yes |
| <a name="input_routing_choice"></a> [routing\_choice](#input\_routing\_choice) | The routing choice for the storage account. | `string` | `"MicrosoftRouting"` | no |
| <a name="input_routing_publish_internet_endpoints"></a> [routing\_publish\_internet\_endpoints](#input\_routing\_publish\_internet\_endpoints) | Whether to publish internet endpoints on the storage account. | `bool` | `false` | no |
| <a name="input_routing_publish_microsoft_endpoints"></a> [routing\_publish\_microsoft\_endpoints](#input\_routing\_publish\_microsoft\_endpoints) | Whether to publish Microsoft endpoints on the storage account. | `bool` | `false` | no |
| <a name="input_sftp_enabled"></a> [sftp\_enabled](#input\_sftp\_enabled) | Whether the storage account is enabled for SFTP | `bool` | `false` | no |
| <a name="input_shared_access_key_enabled"></a> [shared\_access\_key\_enabled](#input\_shared\_access\_key\_enabled) | Whether the storage account has shared access key enabled | `bool` | `true` | no |
| <a name="input_static_website_error_404_document"></a> [static\_website\_error\_404\_document](#input\_static\_website\_error\_404\_document) | The name of the error 404 document for the static website. | `string` | `""` | no |
| <a name="input_static_website_index_document"></a> [static\_website\_index\_document](#input\_static\_website\_index\_document) | The name of the index document for the static website. | `string` | `"index.html"` | no |
| <a name="input_storage_account_name"></a> [storage\_account\_name](#input\_storage\_account\_name) | The name of the storage account | `string` | n/a | yes |
| <a name="input_table_encryption_key_type"></a> [table\_encryption\_key\_type](#input\_table\_encryption\_key\_type) | The encryption key type for the storage account's tables, either 'Service' or 'Account' | `string` | `"Service"` | no |
| <a name="input_tables"></a> [tables](#input\_tables) | A list of the names of the tables that need to be created. | `set(string)` | `[]` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to be added to the storage account. | `map(string)` | `{}` | no |

### Outputs

| Name | Description |
|------|-------------|
| <a name="output_backup_file_shares"></a> [backup\_file\_shares](#output\_backup\_file\_shares) | List of the backup file share. |
| <a name="output_blob_containers"></a> [blob\_containers](#output\_blob\_containers) | List of map of attributes generated by the non-ADLSGen 2 blob containers. |
| <a name="output_endpoints"></a> [endpoints](#output\_endpoints) | Endpoints of the storage account |
| <a name="output_file_shares"></a> [file\_shares](#output\_file\_shares) | List of map of attributes generated by the file shares. |
| <a name="output_id"></a> [id](#output\_id) | Id of the created storage account |
| <a name="output_identity"></a> [identity](#output\_identity) | Identities linked to the storage account |
| <a name="output_name"></a> [name](#output\_name) | Name of the created storage account |
| <a name="output_primary_access_key"></a> [primary\_access\_key](#output\_primary\_access\_key) | (Sensitive) Primary access key of the storage account |
| <a name="output_primary_blob_connection_string"></a> [primary\_blob\_connection\_string](#output\_primary\_blob\_connection\_string) | (Sensitive) Primary blob connection string of the storage account |
| <a name="output_primary_connection_string"></a> [primary\_connection\_string](#output\_primary\_connection\_string) | (Sensitive) Primary connection string of the storage account |
| <a name="output_primary_location"></a> [primary\_location](#output\_primary\_location) | Primary location of the created storage account |
| <a name="output_queues"></a> [queues](#output\_queues) | List of map of attributes generated by the queues. |
| <a name="output_secondary_access_key"></a> [secondary\_access\_key](#output\_secondary\_access\_key) | (Sensitive) Secondary access key of the storage account |
| <a name="output_secondary_blob_connection_string"></a> [secondary\_blob\_connection\_string](#output\_secondary\_blob\_connection\_string) | (Sensitive) Secondary blob connection string of the storage account |
| <a name="output_secondary_connection_string"></a> [secondary\_connection\_string](#output\_secondary\_connection\_string) | (Sensitive) Secondary connection string of the storage account |
| <a name="output_secondary_location"></a> [secondary\_location](#output\_secondary\_location) | Secondary location of the created storage account |
| <a name="output_tables"></a> [tables](#output\_tables) | List of map of attributes generated by the tables. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Contribute

Don't hesitate to create fork and/or branches and contribute to the library!
This repository follows the [ReleaseFlow](https://releaseflow.org/) branching methodology.

## Versioning

This repository follows the [SemanticVersioning 2.0.0](https://semver.org/) versionning methodology.

## Changelog

The changelog is available in the [CHANGELOG.md](./CHANGELOG.md) file.

## License

The code under this repository is available under the MIT license. For more details, please refer yourself to the [license](./LICENSE) file.

## Code of Conduct

This project has adopted the [Microsoft Open Source Code of Conduct](https://opensource.microsoft.com/codeofconduct/).
For more information see the [Code of Conduct FAQ](https://opensource.microsoft.com/codeofconduct/faq/) or
contact [opencode@microsoft.com](mailto:opencode@microsoft.com) with any additional questions or comments.
