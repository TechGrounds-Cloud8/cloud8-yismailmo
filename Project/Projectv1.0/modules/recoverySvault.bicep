@description('Name of the Vault')
param RcoverySvault_Name string = 'recoverySvault'

@description('Enable CRR (Works if vault has not registered any backup instance)')
param enableCRR bool = true

@description('Change Vault Storage Type (Works if vault has not registered any backup instance)')
@allowed([
  'LocallyRedundant'
  'GeoRedundant'
])
param vaultStorageType string = 'LocallyRedundant'

param backup_policyID_in string

@description('Name of the Backup Policy')
param backupolicy_Name string


@description('Location for all resources.')
param location string = resourceGroup().location

var backupFabric = 'Azure'

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
     
    }
  }
 
}




// backup Fabrics // 

resource vaultName_backupFabric_protectionContainer_protectedItem 'Microsoft.RecoveryServices/vaults/backupFabrics/protectionContainers/protectedItems@2022-03-01' = {
  name: '${recoverySvault}/${backupFabric}'
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


resource backupManagment 'Microsoft.RecoveryServices/vaults/backupFabrics/protectionContainers/protectedItems@2021-12-01' = {
  name: '${recoverySvault.name}/${backupFabric}'
  tags: {
    'projectv1.1': 'IsmailAzProject'
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
  name: '${recoverySvault}/${backupFabric}'
  tags: {
    'projectv1.1': 'IsmailAzProject'
  }
  properties: {
    protectedItemType: 'Microsoft.Compute/virtualMachines'
    policyId: backuppolicy.id
    sourceResourceId: webvm.id
  }
}

resource remediate_sym 'Microsoft.PolicyInsights/remediations@2021-10-01' = {
  name: 'remed_backup_policy'
  properties: {
    failureThreshold: {
      percentage: 1
    }
    filters: {
      locations: [
        location
      ]
    }
    policyAssignmentId: backup_policyID_in
    resourceDiscoveryMode: 'ReEvaluateCompliance'
  }
}
