resource "azurerm_kubernetes_cluster" "cluster"{
  name                = "samah-aks"
  location            = var.location
  resource_group_name = var.name
  dns_prefix          = "samah-aks-dns"

  default_node_pool {
    name       = "default"
    node_count = 2
    vm_size    = "Standard_D2_v2"
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "Production"
  }
}
