param storageAccountName string = 'storageaccount10010ddd'
param location string = 'eastus2' // Update with your desired region

// Create a storage account
resource storageAccount 'Microsoft.Storage/storageAccounts@2021-06-01' = {
  name: storageAccountName
  location: location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
}
