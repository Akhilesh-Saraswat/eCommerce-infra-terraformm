terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.31.0"
    }
  }
# The backend configuration is used to store the Terraform state file in Azure Storage
# for this we create a separate resource group and storage account and manually container 
# az group create --name rg-terraformstate --location westeurope
#az storage account create --name devtfstateaccount --resource-group rg-terraformstate
#Manually or using az cli create a rg group storage account and container 
#Here we are using the same storage account and container for all environments(dev, qa, prod)
# The key is the name of the state file, it can be different for each environment

  backend "azurerm" {
    resource_group_name  = "rg-terraformstate"        # Resource group for the state file it will be defferent from main resource group because this is only for sate file
    storage_account_name = "devtfstateaccount"   # Storage account for the state file it will be defferent from main storage account because this is only for sate file
    container_name       = "tfstate"     # Container for the state file it will be defferent from main container because this is only for sate file
    key                  = "dev.terraform.tfstate"
  }
}

provider "azurerm" {
    features {}
    subscription_id = "18b95931-6bb5-431b-a964-40d9c2211486"
  # Configuration options
}