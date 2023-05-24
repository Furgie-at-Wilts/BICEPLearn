param location string = 'uksouth'

resource bicepcreatedstorage 'Microsoft.Storage/storageAccounts@2022-09-01' = {
  name: 'bicepcreatedstorage'
  location: location
  kind: 'StorageV2'
  sku: {
    name: 'Standard_LRS'
  }
}