provider "azurerm" {
  features {}
  subscription_id = "625993dd-b03e-408c-bdd0-dabcd4100720"
}

resource "azurerm_resource_group" "aks_rg" {
  name     = "k4ri-aks-rg"
  location = "East US"
}

resource "azurerm_kubernetes_cluster" "app" {
  name                = "k4ri-aks-cluster"
  location            = azurerm_resource_group.aks_rg.location
  resource_group_name = azurerm_resource_group.aks_rg.name
  dns_prefix          = "k4riakscluster"
  
  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_B2s"
    }
  

  identity {
    type = "SystemAssigned"
  }
}
