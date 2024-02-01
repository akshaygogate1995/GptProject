param storageAccountName string = 'yourstorage1001me'
param functionAppName string = 'yourfun100195'
param location string = 'eastus2'

resource storageAccount 'Microsoft.Storage/storageAccounts@2021-06-01' = {
  name: storageAccountName
  location: location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
}

resource functionApp 'Microsoft.Web/sites@2022-09-01' = {
  name: functionAppName
  location: location
  properties: {
    serverFarmId: ''
    httpsOnly: true
  }
  dependsOn: [storageAccount]
}

output functionAppUrl string = functionApp.properties.defaultHostName
output storageAccountConnectionString string = storageAccount.properties.primaryEndpoints.blob
