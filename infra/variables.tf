variable "resource_group_name" {
  description = "Existing resource group name"
  type        = string
  default     = "webapp001-rg"
}

variable "location" {
  description = "Azure region"
  type        = string
  default     = "westus2"
}

variable "app_service_plan_name" {
  description = "App Service Plan name"
  type        = string
  default     = "webapp001-plan"
}

variable "webapp_name" {
  description = "Windows Web App name (must be globally unique)"
  type        = string
  default     = "webapp001-app"
}
