terraform {
  required_version = ">= 1.3.7"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.39.0"
    }
  }
}
