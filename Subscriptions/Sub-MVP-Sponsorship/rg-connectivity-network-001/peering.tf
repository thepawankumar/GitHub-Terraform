data "azurerm_virtual_network" "RemotevNet" {
  name                      = var.RemotevNet.name
  resource_group_name       = var.RemotevNet.resourcegroup
}

data "azurerm_virtual_network" "ADDS-RemotevNet" {
  provider                  = azurerm.Sub-MVP-Sponsorship-Credits
  name                      = var.ADDS-RemotevNet.name
  resource_group_name       = var.ADDS-RemotevNet.resourcegroup  
}

resource "azurerm_virtual_network_peering" "AVD-To-Connectivity" {
  name                      = "Connectivity-To-AVD"
  resource_group_name       = azurerm_resource_group.resourcegroup.name
  virtual_network_name      = azurerm_virtual_network.vnet.name
  remote_virtual_network_id = data.azurerm_virtual_network.RemotevNet.id
  allow_gateway_transit     = true  
}

resource "azurerm_virtual_network_peering" "ADDS-To-Connectivity" {
  name                      = "Connectivity-To-ADDS"
  resource_group_name       = azurerm_resource_group.resourcegroup.name
  virtual_network_name      = azurerm_virtual_network.vnet.name
  remote_virtual_network_id = data.azurerm_virtual_network.ADDS-RemotevNet.id
  allow_gateway_transit     = true  
}