# Use variables to customize the deployment


# Environment Variables

# Subscription_id_connectivity: This variable is used to specify the subscription ID for the Azure subscription that will be used to deploy connectivity resources. The type of this variable is string.
variable "subscription_id_connectivity" {
  type = string

}

# Subscription_id_identity: This variable is used to specify the subscription ID for the Azure subscription that will be used to deploy identity resources. The type of this variable is string.
variable "subscription_id_identity" {
  type = string

}

# Subscription_id_management: This variable is used to specify the subscription ID for the Azure subscription that will be used to deploy management resources. The type of this variable is string.
variable "subscription_id_management" {
  type = string

}


# Root Management Group Variables

# root_id: This variable is used to specify the ID for the root of the deployment. The default value is "myorg". The type of this variable is string.
variable "root_id" {
  type    = string
  default = "myorg"
}

# root_name: This variable is used to specify the name of the root of the deployment. The default value is "My Organization". The type of this variable is string.
variable "root_name" {
  type    = string
  default = "My Organization"
}

# Connectivity Variables

# deploy_connectivity_resources: This variable is used to determine if connectivity resources should be deployed. The default value is true. The type of this variable is boolean.
variable "deploy_connectivity_resources" {
  type    = bool
  default = true
}

# connectivity_resources_location: This variable is used to specify the location for the connectivity resources deployment. The default value is "northeurope". The type of this variable is string.
variable "connectivity_resources_location" {
  type    = string
  default = "northeurope"
}

# connectivity_resources_tags: This variable is used to specify the tags for the connectivity resources deployment. The default value is a map with a key of "demo_type" and a value of "deploy_connectivity_resources_custom". The type of this variable is map(string).
variable "connectivity_resources_tags" {
  type = map(string)
  default = {
    demo_type = "deploy_connectivity_resources_custom"
  }
}

# Identity Variables
# deploy_identity_resources: This variable is used to determine if identity resources should be deployed. The default value is true. The type of this variable is boolean.
variable "deploy_identity_resources" {
  type    = bool
  default = true
}

# Managment Variables

# deploy_management_resources: This variable is used to determine if management resources should be deployed. The default value is true. The type of this variable is boolean.
variable "deploy_management_resources" {
  type    = bool
  default = true
}

# log_retention_in_days: This variable is used to specify the number of days that log data should be retained. The default value is 50. The type of this variable is number.
variable "log_retention_in_days" {
  type    = number
  default = 50
}

# security_alerts_email_address: This variable is used to specify the email address to be used for security alerts. The default value is "my_valid_security_contact@replace_me". The type of this variable is string.
variable "security_alerts_email_address" {
  type    = string
  default = "my_valid_security_contact@replace_me" # Replace this value with your own email address.
}

# management_resources_location: This variable is used to specify the location for the management resources deployment. The default value is "northeurope". The type of this variable is string.
variable "management_resources_location" {
  type    = string
  default = "northeurope"
}

# management_resources_tags: This variable is used to specify the tags for the management resources deployment. The default value is a map with a key of "demo_type" and a value of "deploy_management_resources_custom". The type of this variable is map(string).
variable "management_resources_tags" {
  type = map(string)
  default = {
    demo_type = "deploy_management_resources_custom"
  }
}
