terraform {
    backend "local" {}
    # backend "azurerm" {
    #     resource_group_name = "testmaxtf"
    #     storage_account_name = "testmaxtf123123"
    #     container_name = "tfstate"
    #     key = "terraform.tfstate"
    #     use_azuread_auth = true
    # }
}
