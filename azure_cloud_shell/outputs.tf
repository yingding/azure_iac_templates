output "storage_account_name" {
  description = "Name of the created Storage Account"
  value       = azurerm_storage_account.cloud_shell_sa.name
}

output "file_share_name" {
  description = "Name of the created File Share"
  value       = azurerm_storage_share.cloud_shell_share.name
}

output "resource_group_name" {
  description = "Name of the Resource Group"
  value       = azurerm_resource_group.cloud_shell_rg.name
}
