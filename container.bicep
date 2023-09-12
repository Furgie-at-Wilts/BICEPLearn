// use ctrl space to get parameter suggestions 
param location string = 'uksouth'

resource mystorageaccount 'Microsoft.Storage/storageAccounts@2022-09-01' existing = {
  name:'biceplearnstorage'
}

resource container 'Microsoft.Storage/storageAccounts/blobServices/containers@2022-09-01' = {
  name: '${mystorageaccount.name}/default/mystorageaccountcontainer2'
  properties:{
    publicAccess:'Blob'
  }
}
resource service 'Microsoft.Storage/storageAccounts/fileServices@2022-09-01' = {
  parent: mystorageaccount
  name: 'default'
}
