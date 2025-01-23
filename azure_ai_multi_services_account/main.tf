resource "azurerm_resource_group" "ai_multi_svc_rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_cognitive_account" "ai_multi_svc_sa" {
  name                     = var.ai_multi_svcs_account_name
  resource_group_name      = azurerm_resource_group.ai_multi_svc_rg.name 
  location                 = azurerm_resource_group.ai_multi_svc_rg.location
  sku_name                 = var.ai_multi_svcs_sku_name
  kind                     = "CognitiveServices"
}