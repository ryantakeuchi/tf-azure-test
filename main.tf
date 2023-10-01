terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "=3.0.1"
    }
    random = {
      source  = "hashicorp/random"
      version = "~>3.5.0"
    }
  }
}

# 1. Generate a random id
resource "random_id" "id" {
  byte_length = 4
}

locals {
  run_id  = (var.name != "" ? var.name : random_id.id.hex)
}

# 2. Configure the AzureRM Provider
provider "azurerm" { 
   subscription_id = var.subscription_id 
   tenant_id       = var.tenant_id 
   client_id       = var.client_id 
   client_secret   = var.client_secret 
   # Provider Configuration options 
   features {} 
}

# 4. Create a virtual network within the resource group
resource "azurerm_virtual_network" "example" {
  name                = "example-network-${random_id.id.hex}"
  resource_group_name = "azure-demo-rt-test"
  location            = "West US 2"
  address_space       = ["172.16.0.0/16"]
}

# 5. Display randomly generated uuid
output "randomly-generated-number" {
  value = local.run_id
}