## sub module azure_cloud_shell/variables.tf
variable "file_share_quota" {
  description = "The quota for the file share"
  type        = number
  default     = 100  # You can set a default value or remove this line if you want it to be mandatory
}

variable "file_share_name" {
  description = "The name of the file share"
  type        = string
  default     = "cloudshellfileshare"  # You can set a default value or remove this line if you want it to be mandatory
}

variable "storage_account_name" {
  description = "The name of the storage account"
  type        = string
  default     = "cloudshellstorage01"  # You can set a default value or remove this line if you want it to be mandatory
}

variable "location" {
  description = "The location of the resources"
  type        = string
  default     = "East US"  # You can set a default value or remove this line if you want it to be mandatory
}

variable "resource_group_name" {
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