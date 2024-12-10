resource "azurerm_storage_account" "source" {
  name                     = "${var.env}${var.prefix}source${random_id.main.hex}"
  resource_group_name      = azurerm_resource_group.main.name
  location                 = azurerm_resource_group.main.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_account" "destination" {
  name                     = "${var.env}${var.prefix}dest${random_id.main.hex}"
  resource_group_name      = azurerm_resource_group.main.name
  location                 = azurerm_resource_group.main.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
