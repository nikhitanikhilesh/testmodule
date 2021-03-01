provider "aws" {
  region = var.region
  access_key = var.access_keys
  secret_key = var.secret_keys
  version = "2.69.0"
  
}

/*
provider "azurerm" {
  # Whilst version is optional, we /strongly recommend/ using it to pin the version of the Provider being used
  version = "1.42.0"
  subscription_id = var.subscription_id
    client_id       = var.client_id
    client_secret   = var.client_secret
    tenant_id       = var.tenant_id
  features {}
}*/
