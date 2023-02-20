terraform {
  #backend "local" {}
  backend "azurerm" {
      resource_group_name = "testmrtf"
      storage_account_name = "testmrtf1231234"
      container_name = "tfstate"
      key = "bootstrap.tfstate"
      use_azuread_auth = true
  }
}
