@description('The name of the Azure Key Vault')
param keyVaultName string

@description('The location of the Azure Key Vault')
param location string

@description('The SKU of the Azure Key Vault')
param skuName string = 'standard'

@description('The object ID of the administrator for the Key Vault')
param tenantObjectId string

resource keyVault 'Microsoft.KeyVault/vaults@2022-11-01' = {
  name: keyVaultName
  location: location
  properties: {
    sku: {
      family: 'A'
      name: skuName
    }
    tenantId: subscription().tenantId
    accessPolicies: [
      {
        tenantId: subscription().tenantId
        objectId: tenantObjectId
        permissions: {
          keys: ['get', 'list', 'create', 'delete', 'update', 'import', 'backup', 'restore', 'recover', 'purge']
          secrets: ['get', 'list', 'set', 'delete', 'recover', 'backup', 'restore']
          certificates: ['get', 'list', 'update', 'create', 'import', 'delete', 'managecontacts', 'getissuers', 'listissuers', 'setissuers', 'deleteissuers', 'manageissuers', 'recover', 'purge']
        }
      }
    ]
  }
}
