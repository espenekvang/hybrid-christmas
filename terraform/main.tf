provider "azurerm" {
    version = "~>2.3.0"
    features {}
}

resource "azurerm_resource_group" "rg-hybrid-christmas" {
    name      = var.resource_group_name
    location  = var.location
    tags      = {
        source = var.source_tag
    }
}

resource "azurerm_app_service" "app_hybrid_christmas" {
  name                = var.app_name
  location            = var.location
  resource_group_name = azurerm_resource_group.rg-hybrid-christmas.name
  app_service_plan_id = var.service_plan_id  

  app_settings = {    
    ASPNETCORE_ENVIRONMENT                             = "Staging"    
  }

  identity {
    type = "SystemAssigned"
  }
  
  tags = {
    source = var.source_tag
  }
}