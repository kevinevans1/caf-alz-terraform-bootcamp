# Dual region Hub and Spoke Topology Deployment

# Get the current client configuration from the AzureRM provider.
# This is used to populate the root_parent_id variable with the
# current Tenant ID used as the ID for the "Tenant Root Group"
# Management Group.

data "azurerm_client_config" "core" {}

# Declare the Azure landing zones Terraform module
# and provide a base configuration.

module "enterprise_scale" {
  source  = "Azure/caf-enterprise-scale/azurerm"
  version = "3.1.2"

  providers = {
    azurerm              = azurerm
    azurerm.management   = azurerm.management
    azurerm.connectivity = azurerm.connectivity
  }

  root_parent_id = data.azurerm_client_config.core.tenant_id
  root_id        = var.root_id
  root_name      = var.root_name

  # Managment Deployment Configuration
  deploy_management_resources    = var.deploy_management_resources
  subscription_id_management     = var.subscription_id_management
  configure_management_resources = local.configure_management_resources

  # Identity Deployment Configuration
  deploy_identity_resources    = var.deploy_identity_resources
  subscription_id_identity     = var.subscription_id_identity
  configure_identity_resources = local.configure_identity_resources

  # Connectivity Deployment Configuration
  deploy_connectivity_resources    = var.deploy_connectivity_resources
  subscription_id_connectivity     = var.subscription_id_connectivity
  configure_connectivity_resources = local.configure_connectivity_resources
}
