@description('Name of the Vault')
param RcoverySvault_Name string = 'recoverySvault'

@description('Enable CRR (Works if vault has not registered any backup instance)')
param enableCRR bool = true

@description('Change Vault Storage Type (Works if vault has not registered any backup instance)')
@allowed([
  'LocallyRedundant'
  'GeoRedundant'
])
param vaultStorageType string = 'GeoRedundant'



@description('Name of the Backup Policy')
param backupolicy_Name string


@description('Location for all resources.')
param location string = resourceGroup().location

var backupFabric = 'Azure'
var protectionContainer = 'iaasvmcontainer;iaasvmcontainerv2;${resourceGroup().name};${ManagementVM}'
var protectedItem = 'vm;iaasvmcontainerv2;${resourceGroup().name};${ManagementVM}'
var protectionContainer2 = 'iaasvmcontainer;iaasvmcontainerv2;${resourceGroup().name};${webvm}'
var protectedItem2 = 'vm;iaasvmcontainerv2;${resourceGroup().name};${webvm}'

resource recoverySvault 'Microsoft.RecoveryServices/vaults@2020-10-01' = {
name: RcoverySvault_Name
  location: location
  sku: {
    name: 'RS0'
    tier: 'Standard'
  }
  identity:{
    type: 'UserAssigned'
    userAssignedIdentities:{
      '${mngId.id}' : {}
    }
  }
 
}

resource mngId 'Microsoft.ManagedIdentity/userAssignedIdentities@2018-11-30' existing = {
  name:  'projectadmin'
}




resource vaultName_backupFabric_protectionContainer_protectedItem 'Microsoft.RecoveryServices/vaults/backupFabrics/protectionContainers/protectedItems@2022-03-01' = {
  name: '${recoverySvault}/${backupFabric}/${protectionContainer}/${protectedItem}'
  properties: {
    protectedItemType: 'Microsoft.Compute/virtualMachines'
    policyId: '${recoverySvault.id}/backupPolicies/${backuppolicy}'
    sourceResourceId: ManagementVM.id
  }
} 


//BACKUP_POLICY
resource backuppolicy 'Microsoft.RecoveryServices/vaults/backupPolicies@2022-03-01' = {
  parent: recoverySvault
  name:backupolicy_Name
  location: location
  properties: {
    backupManagementType: 'AzureIaasVM'
    schedulePolicy: {
      scheduleRunFrequency: 'Daily'
      schedulePolicyType: 'SimpleSchedulePolicy'
      scheduleRunTimes: [
        '2022-03-17T00:30:0Z'
      ]
    }
    retentionPolicy: {
      retentionPolicyType: 'LongTermRetentionPolicy'
      dailySchedule: {
        retentionTimes: [
          '2022-03-17T00:30:0Z'
        ]
        retentionDuration: {
          count: 7
          durationType: 'Days'
        }
      }
    }
  }
}


resource vaultName_vaultstorageconfig 'Microsoft.RecoveryServices/vaults/backupstorageconfig@2022-02-01' = {
  parent: recoverySvault
  name: 'vaultstorageconfig'
  properties: {
    storageModelType: vaultStorageType
    crossRegionRestoreFlag: enableCRR
  }
}


resource ManagementVM 'Microsoft.Compute/virtualMachines@2021-03-01' existing = {
  name: 'adminserv'
}
resource webvm 'Microsoft.Compute/virtualMachines@2020-06-01' existing = {
  name: 'webserv'
}


resource backupAdmin 'Microsoft.RecoveryServices/vaults/backupFabrics/protectionContainers/protectedItems@2021-12-01' = {
  name: '${recoverySvault.name}/${backupFabric}/${protectionContainer}/${protectedItem}'
  tags: {
    'projectv1': 'jamaltadrous'
  }
  properties: {
    protectedItemType: 'Microsoft.Compute/virtualMachines'
    policyId: backuppolicy.id
    sourceResourceId: ManagementVM.id
  }
  dependsOn:[
  backupWeb
  ]
} 


resource backupWeb 'Microsoft.RecoveryServices/vaults/backupFabrics/protectionContainers/protectedItems@2021-12-01' = {
  name: '${recoverySvault}/${backupFabric}/${protectionContainer2}/${protectedItem2}'
  tags: {
    'projectv1': 'jamaltadrous'
  }
  properties: {
    protectedItemType: 'Microsoft.Compute/virtualMachines'
    policyId: backuppolicy.id
    sourceResourceId: webvm.id
  }
}
