targetScope = 'resourceGroup'

@description('Specifies the Azure location where the key vault should be created.')
param location string = resourceGroup().location



resource storageacc 'Microsoft.Storage/storageAccounts@2021-09-01'={
  name: 'projectv1storage'
  location: location

  sku:  {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
  properties:{
    accessTier: 'Hot'/* look into the storage tier*/
  }
  
}



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
  

/* Storage blob encryption from the requirements that all  Disks must be encrypted*/






output storageacc string = string(storageacc)
output storageAccountResourceGroup string = resourceGroup().name
output location string = location
