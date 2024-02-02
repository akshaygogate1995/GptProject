param vnetName string = 'MyVNet'
param addressPrefix string = '10.0.0.0/16'
param subnetName string = 'MySubnet'
param subnetPrefix string = '10.0.0.0/24'

// Define the VNet
resource vnet 'Microsoft.Network/virtualNetworks@2021-02-01' = {
  name: vnetName
  location: 'eastus2'
  properties: {
    addressSpace: {
      addressPrefixes: [
        addressPrefix
      ]
    }
    subnets: [
      {
        name: subnetName
        properties: {
          addressPrefix: subnetPrefix
        }
      }
    ]
  }
}

output vnetId string = vnet.id
