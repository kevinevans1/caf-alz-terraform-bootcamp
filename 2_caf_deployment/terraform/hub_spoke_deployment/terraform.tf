# We strongly recommend using the required_providers block to set the
# Azure Provider source and version being used.

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.39.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "testmrtf"
    storage_account_name = "testmrtf1231234"
    container_name       = "tfstate"
    key                  = "caf_hns.tfstate"
    use_azuread_auth     = true
  }
}

# Declare a standard provider block using your preferred configuration.
# This will be used for the deployment of all "Core resources".

provider "azurerm" {
  features {}
}


# Declare a standard provider block using your preferred configuration.
# This will be used for the deployment of all "Management resources" to the specified `subscription_id`.

provider "azurerm" {
  alias           = "management"
  subscription_id = var.subscription_id_management
  features {}
}

# Declare an aliased provider block using your preferred configuration.
# This will be used for the deployment of all "Identity resources" to the specified `subscription_id`.

provider "azurerm" {
  alias           = "identity"
  subscription_id = var.subscription_id_identity
  features {}
}


# Declare an aliased provider block using your preferred configuration.
# This will be used for the deployment of all "Connectivity resources" to the specified `subscription_id`.

provider "azurerm" {
  alias           = "connectivity"
  subscription_id = var.subscription_id_connectivity
  features {}
}
