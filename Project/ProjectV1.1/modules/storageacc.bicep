// parameters

targetScope = 'resourceGroup'

@description('Specifies the Azure location where the key vault should be created.')
param location string = resourceGroup().location

param containerName string =  'StorageContainer'


// Storage account //
resource storageacc 'Microsoft.Storage/storageAccounts@2021-09-01'={
  name: 'projectv1storage'
  location: location

  sku:  {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
  properties:{
    accessTier: 'Hot'
  }
  
}

// Btorage Blob Servoces //
resource blobServices 'Microsoft.Storage/storageAccounts/blobServices@2021-09-01' = {
  parent: storageacc
  name: 'default'
  properties: {
    deleteRetentionPolicy: {
      enabled: true
      days: 30
    }
    automaticSnapshotPolicyEnabled:true
    isVersioningEnabled: true
    restorePolicy:{
      enabled: true
      days:14
    }
    changeFeed: {
      enabled: true
      retentionInDays: 14
    }
  }
}
  

// Container //
resource storageContainer 'Microsoft.Storage/storageAccounts/blobServices/containers@2021-08-01' = {
  name: containerName
  parent: blobServices
  properties: {
    defaultEncryptionScope: '$account-encryption-key'
    denyEncryptionScopeOverride: false
    immutableStorageWithVersioning: {
      enabled: false
    }
    publicAccess: 'None'
  }
}






output storageacc string = string(storageacc)
output storageAccountResourceGroup string = resourceGroup().name
output location string = location
