## sub module azure_cloud_shell/variables.tf
variable "cloud_shell_file_share_quota" {
  description = "The quota for the file share"
  type        = number
  default     = 100  # You can set a default value or remove this line if you want it to be mandatory
}

variable "cloud_shell_file_share_name" {
  description = "The name of the file share"
  type        = string
  default     = "cloudshellfileshare"  # You can set a default value or remove this line if you want it to be mandatory
}

variable "cloud_shell_storage_account_name" {
  description = "The name of the storage account"
  type        = string
  default     = "cloudshellstorage01"  # You can set a default value or remove this line if you want it to be mandatory
}

variable "cloud_shell_location" {
  description = "The location of the resources"
  type        = string
  default     = "East US"  # You can set a default value or remove this line if you want it to be mandatory
}

variable "cloud_shell_rg_name" {
  description = "The name of the resource group"
  type        = string
  default     = "cloud-shell-rg"  # You can set a default value or remove this line if you want it to be mandatory  
}

## Adding ephemeral variables for the subscription_id, client_id, tenant_id and client_secret
variable "subscription_id" {
  type      = string
  ephemeral = true
}

variable "client_id" {
  type      = string
  ephemeral = true
}

variable "tenant_id" {
  type      = string
  ephemeral = true
}

variable "client_secret" {
  type      = string
  ephemeral = true
}

## Azure Container Registry Module variables
variable "acr_rg_name" {
  description = "Name of Azure Container Registry Resource Group"
  type        = string
  default     = "rg1"
}

variable "acr_location" {
  description = "Azure region where resources will be created"
  type        = string
  default     = "Sweden Central" # "West Europe"
}

variable "acr_name" {
  description = "The global unique azure container registry name"
  type        = string
  default     = "megaacr1"
}

variable "acr_env_tag_value" {
  description = "The tag value for the container registry"
  type        = string
  default     = "megapatitodev"
}

variable "acr_token_name" {
  description = "The name of the container registry token"
  type        = string
  default     = "acrpushalltoken1"
}

## Azure AI Multi Services Account Module variables
variable "ai_multi_svcs_rg_name" {
  description = "Name of Azure AI Multi Services Account Resource Group"
  type        = string
  default     = "sandbox-ai-multi-svcs-rg"
}

variable "ai_multi_svcs_account_name" {
  description = "The global unique azure AI multi services account name"
  type        = string
  default     = "sandboxaimultisvcsaccount01"
}

variable "ai_multi_svcs_location" {
  description = "Azure region where resources will be created"
  type        = string
  default     = "East US" # "West Europe"
}

variable "ai_multi_svcs_sku_name" {
  description = "The SKU name for the AI multi services account"
  type        = string
  default     = "S0"
}