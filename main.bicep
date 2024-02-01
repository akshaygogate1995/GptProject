targetScope = 'subscription'

@description('Name of the environment used to generate a short unique hash for resources.')
@minLength(1)
@maxLength(64)
param webAppName string

@description('Primary location for all resources')
@allowed([ 'centralus', 'eastus2', 'eastasia', 'westeurope', 'westus2', 'australiaeast', 'eastus', 'francecentral', 'japaneast', 'nortcentralus', 'swedencentral', 'switzerlandnorth', 'uksouth' ])
param location string
param tags string = ''

