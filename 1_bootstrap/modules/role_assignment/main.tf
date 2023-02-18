resource "azurerm_role_assignment" "this" {
  count                            = var.enabled ? 1 : 0
  scope                            = var.scope
  role_definition_id               = var.role_definition_id != null ? var.role_definition_id : null
  role_definition_name             = var.role_definition_name != null ? var.role_definition_name : null
  principal_id                     = var.principal_id
  skip_service_principal_aad_check = var.skip_service_principal_aad_check
}
