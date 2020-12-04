provider "azurerm" {
  version   = "~>2.38.0"
  features {}
}

resource "azurerm_resource_group" "rg_hybrid_christmas" {
  name      = var.resource_group_name
  location  = var.location
  tags      = {
    source  = var.source_tag
  }
}

resource "azurerm_relay_namespace" "sb_northpole" {
  name                = var.relay_name
  location            = var.location
  resource_group_name = azurerm_resource_group.rg_hybrid_christmas.name

  sku_name            = "Standard"

  tags                = {
    source            = var.source_tag
  }
}

resource "azurerm_relay_hybrid_connection" "hcn_northpole" {
  name                          = "hcn-northpole"
  resource_group_name           = azurerm_resource_group.rg_hybrid_christmas.name
  relay_namespace_name          = azurerm_relay_namespace.sb_northpole.name
  requires_client_authorization = true
  user_metadata                 = "{'key':'endpoint','value':'${var.northpole_hostname}:${var.northpole_hostport}'}"
}

resource "azurerm_app_service" "app_hybrid_christmas" {
  name                      = var.app_name
  location                  = var.location
  resource_group_name       = azurerm_resource_group.rg_hybrid_christmas.name
  app_service_plan_id       = var.service_plan_id  

  app_settings              = {    
    ASPNETCORE_ENVIRONMENT  = "Staging"    
  }

  identity {
    type                    = "SystemAssigned"
  }
  
  tags                      = {
    source                  = var.source_tag
  }
}

#Unfortunately there is an open issue with this part: https://github.com/terraform-providers/terraform-provider-azurerm/issues/9245 
#consequently it needs to be done manually in https://portal.azure.com to get it to work

#resource "azurerm_app_service_hybrid_connection" "hcn_app_connection" {
#  app_service_name    = azurerm_app_service.app_hybrid_christmas.name
#  resource_group_name = azurerm_resource_group.rg_hybrid_christmas.name
#  relay_id            = azurerm_relay_hybrid_connection.hcn_northpole.id
#  hostname            = var.northpole_hostname
#  port                = var.northpole_hostport  
#}