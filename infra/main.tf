terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
  required_version = ">= 1.5.0"
}

provider "azurerm" {
  features {}
}

# Reference existing resource group — do not create
data "azurerm_resource_group" "rg" {
  name = var.resource_group_name
}

# App Service Plan (Windows)
resource "azurerm_service_plan" "plan" {
  name                = var.app_service_plan_name
  resource_group_name = data.azurerm_resource_group.rg.name
  location            = data.azurerm_resource_group.rg.location
  os_type             = "Windows"
  sku_name            = "F1" # Free tier — change to B1 for production
}

# Windows Web App
resource "azurerm_windows_web_app" "app" {
  name                = var.webapp_name
  resource_group_name = data.azurerm_resource_group.rg.name
  location            = data.azurerm_resource_group.rg.location
  service_plan_id     = azurerm_service_plan.plan.id

  https_only = true

  site_config {
    application_stack {
      current_stack  = "dotnet"
      dotnet_version = "v8.0"
    }
    always_on = false # must be false on Free tier
  }
}
