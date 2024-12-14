terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.13.0"
    }
    azapi = {
      source = "Azure/azapi"
    }
  }
  backend "azurerm" {
  }
}

provider "azurerm" {
  features {}
}

provider "azapi" {
  # Configuration options for azapi provider
}

resource "random_id" "main" {
  keepers = {
    # Generate a new id each time the location changes
    location = var.location
  }

  byte_length = 3
}

resource "azurerm_resource_group" "main" {
  name     = "${var.env}-${var.prefix}-${random_id.main.hex}-rg"
  location = var.location
}


output "unique_id" {
  value = random_id.main.hex
}
