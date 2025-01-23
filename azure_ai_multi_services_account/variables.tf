variable "resource_group_name" {
  description = "Name of the Resource Group"
  type        = string
}

variable "location" {
  description = "Azure region where resources will be created"
  type        = string
}

variable "ai_multi_svcs_account_name" {
  description = "Name of the Storage Account"
  type        = string
}

variable "ai_multi_svcs_sku_name" {
  description = "SKU Name for the Azure AI Multi Services Account"
  type        = string
  default     = "S0"
}