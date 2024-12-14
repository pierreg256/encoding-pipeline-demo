resource "azapi_resource" "source" {
  type      = "Microsoft.Storage/storageAccounts@2021-04-01"
  name      = "${var.env}${var.prefix}source${random_id.main.hex}"
  location  = azurerm_resource_group.main.location
  parent_id = azurerm_resource_group.main.id

  body = {
    sku = {
      name = "Standard_LRS"
    }
    kind = "StorageV2"
    properties = {
      allowSharedKeyAccess = false
    }
  }
}

resource "azapi_resource" "source_container" {
  type      = "Microsoft.Storage/storageAccounts/blobServices/containers@2021-04-01"
  name      = "files"
  parent_id = "${azapi_resource.source.id}/blobServices/default"

  body = {}
}

resource "azapi_resource" "destination" {
  type      = "Microsoft.Storage/storageAccounts@2021-04-01"
  name      = "${var.env}${var.prefix}dest${random_id.main.hex}"
  location  = azurerm_resource_group.main.location
  parent_id = azurerm_resource_group.main.id

  body = {
    sku = {
      name = "Standard_LRS"
    }
    kind = "StorageV2"
    properties = {
      allowSharedKeyAccess = false
    }
  }
}

resource "azapi_resource" "destination_container" {
  type      = "Microsoft.Storage/storageAccounts/blobServices/containers@2021-04-01"
  name      = "files"
  parent_id = "${azapi_resource.destination.id}/blobServices/default"

  body = {}
}
