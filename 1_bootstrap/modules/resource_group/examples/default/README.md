# Default example

## Introduction

Test module in a normal use case.

## Module

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
### Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.7 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 3.39.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | >= 3.3.1 |

### Providers

| Name | Version |
|------|---------|
| <a name="provider_random"></a> [random](#provider\_random) | 3.4.3 |

### Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_resource_group_default"></a> [resource\_group\_default](#module\_resource\_group\_default) | ../../ | n/a |

### Resources

| Name | Type |
|------|------|
| [random_string.this_default](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) | resource |

### Inputs

No inputs.

### Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | Resource ID of the resource group. |
| <a name="output_location"></a> [location](#output\_location) | Location of the resource group. |
| <a name="output_name"></a> [name](#output\_name) | Name of the resource group. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
