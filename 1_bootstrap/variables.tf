variable "bootstrap_resource_group_name" {
  type        = string
  description = "(Required) Name of the resource group containing the bootstrap resources."
}

variable "bootstrap_resource_group_location" {
  type        = string
  description = "(Required) Location of the resource group containing the bootstrap resources."
  default     = "canadacentral"
}

variable "bootstrap_resource_group_tags" {
  type        = map(any)
  description = "(Optional) Tags to apply on the resource group containing the bootstrap resources."
  default = {
    test = "test"
  }
}

variable "bootstrap_storage_account_name" {
  type        = string
  description = "(Required) Name of the bootstrap storage account."
  default     = "testtf123123"
}

variable "bootstrap_storage_account_blob_containers" {
  type        = map(any)
  description = "(Required) Map of blob containers to create on the bootstrap storage account."
  default = {
    namecontainer = {}
  }
}

variable "bootstrap_storage_account_tags" {
  type        = map(any)
  description = "(Optional) Tags to apply on the bootstrap storage acount."
  default = {
    test = "test"
  }
}
