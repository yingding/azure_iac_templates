terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.15.0" # "~>3.114.0" 
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 3.0.2" # "~> 2.53.1"
    }
  }
}

# provider "azurerm" {
#   features {}
# }

# this works without VPN in the office
provider "azurerm" {
    subscription_id = var.subscription_id
    client_secret = var.client_secret
    client_id = var.client_id
    tenant_id = var.tenant_id
    features {}
}

data "azurerm_client_config" "current" {}
data "azuread_client_config" "current" {}
data "azurerm_subscription" "current" {}

# create testing resources
# resource "null_resource" "foo" {}

# create cloud shell resources
module "cloud_shell" {
  source               = "../azure_cloud_shell" # Path to the module
  resource_group_name  = var.cloud_shell_rg_name
  location             = var.cloud_shell_location
  storage_account_name = var.cloud_shell_storage_account_name
  file_share_name      = var.cloud_shell_file_share_name
  file_share_quota     = var.cloud_shell_file_share_quota
}

# create Azure AI multi services account
module "ai_multi_svcs" {
  source = "../azure_ai_multi_services_account"
  resource_group_name = var.ai_multi_svcs_rg_name
  location = var.ai_multi_svcs_location
  ai_multi_svcs_account_name = var.ai_multi_svcs_account_name
  ai_multi_svcs_sku_name = var.ai_multi_svcs_sku_name
}
output "ai_multi_svcs_account_name" {
  value = module.ai_multi_svcs.ai_multi_svcs_account_name
}
output "ai_multi_svcs_sku_name" {
  value = module.ai_multi_svcs.ai_multi_svcs_sku_name
}