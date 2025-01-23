output "resource_group_name" {
  description = "Name of the Resource Group"
  value       = azurerm_resource_group.ai_multi_svc_rg.name 
}

output "ai_multi_svcs_account_name" {
  description = "Name of the Azure AI Multi Services Account"
  value     = azurerm_cognitive_account.ai_multi_svc_sa.name
}

output "ai_multi_svcs_sku_name" {
  description = "SKU Name for the Azure AI Multi Services Account"
  value       = azurerm_cognitive_account.ai_multi_svc_sa.sku_name
}
