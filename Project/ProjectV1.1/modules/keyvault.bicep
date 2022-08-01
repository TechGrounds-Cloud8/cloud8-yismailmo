
targetScope = 'resourceGroup'
@description('Specifies the name of the key vault.')
param keyVaultName string

@description('Specifies the Azure location where the key vault should be created.')
param location string = resourceGroup().location

@description('Specifies whether Azure Virtual Machines are permitted to retrieve certificates stored as secrets from the key vault.')
param enabledForDeployment bool = true

@description('Specifies whether Azure Disk Encryption is permitted to retrieve secrets from the vault and unwrap keys.')
param enabledForDiskEncryption bool = true

@description('Specifies whether Azure Resource Manager is permitted to retrieve secrets from the key vault.')
param enabledForTemplateDeployment bool = true

@description('Specifies the Azure Active Directory tenant ID that should be used for authenticating requests to the key vault. Get it by using Get-AzSubscription cmdlet.')
param tenantId string = subscription().tenantId

@description('Specifies the object ID of a user, service principal or security group in the Azure Active Directory tenant for the vault. The object ID must be unique for the list of access policies. Get it by using Get-AzADUser or Get-AzADServicePrincipal cmdlets.')
param objectId string = 'e86f7f25-f048-4436-afc9-3c0415281672'


@description('Specifies whether the key vault is a standard vault or a premium vault.')
@allowed([
  'standard'
  'premium'
])
param skuName string = 'standard'


resource vault 'Microsoft.KeyVault/vaults@2019-09-01' = {
  name: keyVaultName
  location: location
  tags: {
    displayName: 'KeyVault'
  }
  properties: {
    enabledForDeployment: enabledForDeployment
    enabledForTemplateDeployment: enabledForTemplateDeployment
    enabledForDiskEncryption: enabledForDiskEncryption
    tenantId: tenantId
    accessPolicies: [
      {
        objectId: objectId
        tenantId: tenantId
        permissions: {
          keys: [
            'all'
          ]
          secrets: [
            'all'
          ]
          certificates: [
            'all'
          ]
          storage: [
            'all'
          ]
        }
      }
    ]
    sku: {
      name: skuName
      family: 'A'
    }
    networkAcls: {
      defaultAction: 'Allow'
      bypass: 'AzureServices'
    }
  }
}

resource mngId 'Microsoft.ManagedIdentity/userAssignedIdentities@2018-11-30' = {
  name:  'admin'
  location: location
  dependsOn: [
    vault
  ]
}

resource secret 'Microsoft.KeyVault/vaults/secrets@2019-09-01' = {
  name: '${keyVaultName}/mySecret'  // The first part is KV's name
  properties: {
    value: 'mySecretValue'
  }
}
resource vmdiskencryption 'Microsoft.Compute/diskEncryptionSets@2022-03-02' = {
  name: 'vmdiskencrypt'
  location: location
  identity: {
    type: 'systemAssignedIdentities'
  }
  properties:{
    activeKey:{
      sourceVault:{
        id: keyVaultName
      }
      keyUrl: keyVaultName
    }
  }
}
    

/* create key */
resource RSAkey 'Microsoft.KeyVault/vaults/keys@2021-10-01' = {
  name: 'RSAKey'
  parent: vault
  properties: {
    kty: 'RSA' // key type
    keySize: 4096
    keyOps: [
      // key operations
      'encrypt'
      'decrypt'
    ]
    
    attributes:{
      enabled: true
    }
  }
}




output keyvaultId string = vault.id
output Key object = RSAkey
output objectId string = objectId
