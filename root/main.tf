terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      # version = "~>3.114.0" 
      version = "~> 4.15.0" # "~>3.114.0" 
    }
    azuread = {
      source  = "hashicorp/azuread"
      # version = "~> 2.53.1"
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
  resource_group_name  = var.resource_group_name
  location             = var.location
  storage_account_name = var.storage_account_name
  file_share_name      = var.file_share_name
  file_share_quota     = var.file_share_quota
}