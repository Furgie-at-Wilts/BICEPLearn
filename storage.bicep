// use ctrl space to get parameter suggestions 
param location string = 'uksouth'

resource mystorageaccount 'Microsoft.Storage/storageAccounts@2022-09-01' = {
  name:'biceplearnstorage'
  location: location
  kind:'StorageV2'
  sku: {
    name:'Standard_LRS'
  }
  properties:{
    accessTier:'Cool'
    supportsHttpsTrafficOnly:true
  }
}

resource container 'Microsoft.Storage/storageAccounts/blobServices/containers@2022-09-01' = {
  name: '${mystorageaccount.name}/default/mystorageaccountcontainer'
  properties:{
    publicAccess:'Blob'
  }
  dependsOn:[
    mystorageaccount
  ]
}
