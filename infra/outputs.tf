output "resource_group_name" {
  description = "Resource group name"
  value       = data.azurerm_resource_group.rg.name
}

output "webapp_name" {
  description = "Web App name"
  value       = azurerm_windows_web_app.app.name
}

output "default_hostname" {
  description = "Default HTTPS hostname"
  value       = "https://${azurerm_windows_web_app.app.default_hostname}"
}
