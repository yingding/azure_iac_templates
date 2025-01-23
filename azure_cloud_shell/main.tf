resource "azurerm_resource_group" "cloud_shell_rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_storage_account" "cloud_shell_sa" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.cloud_shell_rg.name
  location                 = azurerm_resource_group.cloud_shell_rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  allow_nested_items_to_be_public = false
  # this tag will be added to the resource automatically, while choosing this storage account for the cloud shell in azure portal
  tags = {
    "ms-resource-usage" = "azure-cloud-shell"
  }
}

resource "azurerm_storage_share" "cloud_shell_share" {
  name                 = var.file_share_name
  storage_account_id = azurerm_storage_account.cloud_shell_sa.id
  # storage_account_name = azurerm_storage_account.cloud_shell_sa.name
  quota                = var.file_share_quota
}
