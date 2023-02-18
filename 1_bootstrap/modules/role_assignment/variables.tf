variable "enabled" {
  description = "(Optional) Define if the use of the module is enabled or not. Great for test purposes."
  type        = bool
  default     = true
}

variable "scope" {
  description = "(Required) Resource ID of the scope of the assignment.."
  type        = string
}

variable "role_definition_id" {
  description = "(Optional) Resource ID of the built-in or custom role definition to assign to the principal on the scope. Cannot be used at the same time as `role_definition_name`."
  type        = string
  default     = null
}

variable "role_definition_name" {
  description = "(Optional) Name of the built-in definition to assign to the principal on the scope. Cannot be used at the same time as `role_definition_id`."
  type        = string
  default     = null
}

variable "principal_id" {
  description = "(Required) ID of the Azure Active Directory principal to which the role will be assigned onto the scope. Can be a user, group or service principal."
  type        = string
}

variable "skip_service_principal_aad_check" {
  description = "(Optional) Allows to skip the service principal check on AAD. Useful if there's sync delays with AAD when a SP was just created."
  type        = bool
  default     = false
}
