# terraform-azurerm-module-role-assignment

## Introduction


## Build and Test

TBD

## Module

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
### Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.7 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 3.39.0 |

### Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.39.0 |

### Modules

No modules.

### Resources

| Name | Type |
|------|------|
| [azurerm_role_assignment.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_enabled"></a> [enabled](#input\_enabled) | (Optional) Define if the use of the module is enabled or not. Great for test purposes. | `bool` | `true` | no |
| <a name="input_principal_id"></a> [principal\_id](#input\_principal\_id) | (Required) ID of the Azure Active Directory principal to which the role will be assigned onto the scope. Can be a user, group or service principal. | `string` | n/a | yes |
| <a name="input_role_definition_id"></a> [role\_definition\_id](#input\_role\_definition\_id) | (Optional) Resource ID of the built-in or custom role definition to assign to the principal on the scope. Cannot be used at the same time as `role_definition_name`. | `string` | `null` | no |
| <a name="input_role_definition_name"></a> [role\_definition\_name](#input\_role\_definition\_name) | (Optional) Name of the built-in definition to assign to the principal on the scope. Cannot be used at the same time as `role_definition_id`. | `string` | `null` | no |
| <a name="input_scope"></a> [scope](#input\_scope) | (Required) Resource ID of the scope of the assignment.. | `string` | n/a | yes |
| <a name="input_skip_service_principal_aad_check"></a> [skip\_service\_principal\_aad\_check](#input\_skip\_service\_principal\_aad\_check) | (Optional) Allows to skip the service principal check on AAD. Useful if there's sync delays with AAD when a SP was just created. | `bool` | `false` | no |

### Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | Resource ID of the assignment. |
| <a name="output_principal_type"></a> [principal\_type](#output\_principal\_type) | Principal type of the principal id.. |
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
