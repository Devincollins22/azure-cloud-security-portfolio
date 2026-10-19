# ---------------------------------------------------------
# Virtual network: your private network in Azure
# ---------------------------------------------------------
resource "azurerm_virtual_network" "main" {
  name                = "vnet-landing-zone"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  address_space       = ["10.10.0.0/16"]
}

# ---------------------------------------------------------
# Subnet 1: web tier (the only part that faces the internet)
# ---------------------------------------------------------
resource "azurerm_subnet" "web" {
  name                 = "snet-web"
  resource_group_name  = azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = ["10.10.1.0/24"]
}

# ---------------------------------------------------------
# Subnet 2: app tier (only the web tier can talk to it)
# ---------------------------------------------------------
resource "azurerm_subnet" "app" {
  name                 = "snet-app"
  resource_group_name  = azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = ["10.10.2.0/24"]
}

# ---------------------------------------------------------
# Subnet 3: data tier (most protected; only the app tier can reach it)
# ---------------------------------------------------------
resource "azurerm_subnet" "data" {
  name                 = "snet-data"
  resource_group_name  = azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = ["10.10.3.0/24"]
}