output "id" {
  description = "Resource ID of the assignment."
  value       = concat(azurerm_role_assignment.this[*].id, [""])[0]
}

output "principal_type" {
  description = "Principal type of the principal id.."
  value       = concat(azurerm_role_assignment.this[*].principal_type, [""])[0]
}
