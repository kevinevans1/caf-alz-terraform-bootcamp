# Migrating Terraform State from Local Backend to Azurerm Backend

This README provides steps to migrate a Terraform state file from a local backend to an Azurerm backend using a blob storage account with the use_azure_ad feature set to on.

## Prerequisites
- An Azure subscription
- Terraform 0.13 or later installed on your local machine and the binary was added to your machine's PATH.
- VSCode (or any text editor), PowerShell, git and Azure CLI installed on your local machine

## Steps

1. Clone the `caf-alz-terraform-bootcamp` repository onto your machine and take note of the path of the folder.

1. Open the file `localvar.tfvars` located in the folder `caf-alz-terraform-bootcamp/1_bootstrap` using a text editor (ex: VSCode)

1. Modify the values in the variable file to reflect the resources you want to create.

```hcl
bootstrap_resource_group_name     = "testmrtf"
bootstrap_resource_group_location = "canadacentral"
bootstrap_resource_group_tags = {
  ManagedBy = "Terraform"
  Type      = "Bootstrap"
}
bootstrap_storage_account_name = "testmrtf123123"
bootstrap_storage_account_blob_containers = {
  tfstate = {}
}
bootstrap_storage_account_tags = {
  ManagedBy = "Terraform"
  Type      = "Bootstrap"
}

```

Technically, you can change minimally the values for the following variables `bootstrap_resource_group_name`, `bootstrap_storage_account_name` and it will provide the variables to create a resource group and a storage account on Canada Central with a container named tfstate.

1. Save the file.

1. Open a PowerShell prompt.

1. Log in to Azure CLI using PowerShell using the following command:

```pwsh
az login
```

1. Set the default subscription for the current context:

```pwsh
az account set --subscription <SUBSCRIPTION_ID>
```

Note: Replace <SUBSCRIPTION_ID> with the ID of your Azure subscription.

1. Change the current directory to the `caf-alz-terraform-bootcamp` folder you have cloned. Then change it to the `1_bootstrap` folder.

1. Run `terraform init` from PowerShell, in the `1_bootstrap` to initialize the Terraform working directory.

1. Run `terraform plan --var-file=./localvar.tfvars` to preview the resources that will be created.

1. If the preview looks correct, run `terraform apply --var-file=./localvar.tfvars` to create the resources. Approve the deployment when needed.

1. Once the resources have been created, open the file `backend.tf` with a text editor.

1. Comment the line `backend "local" {}` and uncomment the lines containing

```hcl
  backend "azurerm" {
    resource_group_name  = "<RESOURCE_GROUP_NAME>"
    storage_account_name = "<STORAGE_ACCOUNT_NAME>"
    container_name       = "<CONTAINER_NAME>"
    key                  = "terraform.tfstate"
  }
```

1. Change the values to reflect what you have set in the `localvar.tfvars` file.

1. Save the updated configuration file.

1. Run `terraform init --migrate-state` to initialize the backend and migrate the state from the local backend to the AzureRM backend (storage account).

1. Run `terraform refresh` to make sure the state has been migrated adequately.

That's it! The state of the deployment you did earlier is now on the storage account you have deployed! The Terraform state has now been migrated from a local backend to an AzureRM backend using a blob storage account. You can now use the storage account and blob container to host the state file of your other deployments and if you need to update its configurations, you can use Terraform to do so.

You can reuse the same configurations found in the backend.tf file in the future exercices. It's *imperative* that you change the key value to a different name (ex: bootstrap.tfstate -> caf-connectivity.tfstate).
