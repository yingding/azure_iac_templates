variable "resource_group_name" {
  description = "Name of the Resource Group"
  type        = string
}

variable "location" {
  description = "Azure region where resources will be created"
  type        = string
}

variable "storage_account_name" {
  description = "Name of the Storage Account"
  type        = string
}

variable "file_share_name" {
  description = "Name of the File Share"
  type        = string
}

variable "file_share_quota" {
  description = "Quota for the File Share (in GB)"
  type        = number
  default     = 5
}