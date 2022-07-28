// reference to an existing virtual machine that was previously created
resource rVirtualMachine 'Microsoft.Compute/virtualMachines@2020-12-01' existing = {
  name: 'Vm1'  


// create the recovery service vault resource
resource rRecoveryServiceVauct 'Microsoft.RecoveryServices/vaults@2016-06-01' = {
  name: 'rsv-playground-01'
  location: resourceGroup().location
  properties: {}
  sku: {
    name: 'Standard'
  }
}

// create the customized recovery service vault backup policy for Azure virtual machine
resource rRecoveryServiceVaultBackupPolicy 'Microsoft.RecoveryServices/vaults/backupPolicies@2021-03-01' = {
  name: '${rRecoveryServiceVault.name}/rsv-backup-policy-playground-01'
  properties: {
    backupManagementType: 'AzureIaasVM'
    instantRpRetentionRangeInDays: 5
    timeZone: 'Eastern Standard Time'
    protectedItemsCount: 0
    schedulePolicy: {
      schedulePolicyType: 'SimpleSchedulePolicy'
      scheduleRunFrequency: 'Weekly'
      scheduleRunDays: [
        'Sunday'
      ]
      scheduleRunTimes: [
        '2021-07-13T23:00:00Z'
      ]
      scheduleWeeklyFrequency: 0
    }
    retentionPolicy: {
      retentionPolicyType: 'LongTermRetentionPolicy'
      weeklySchedule: {
        daysOfTheWeek: [
          'Sunday'
        ]
        retentionTimes: [
          '2021-07-13T23:00:00Z'
        ]
        retentionDuration: {
          count: 12
          durationType: 'Weeks'
        }
      }
    }
  }
}

// backup storage configuration
resource rBackupStorageConfig 'Microsoft.RecoveryServices/vaults/backupstorageconfig@2018-12-20' = {
  name: '${rRecoveryServiceVault.name}/vaultStorageConfig'
  properties: {
    storageModelType: 'LocallyRedundant'
    storageType: 'LocallyRedundant'
  }
}

var rgName = 'rg-playground-01'
var vmProtectionContainerName = 'iaasvmcontainer;iaasvmcontainerv2;'
var vmProtectedItemName = 'vm;iaasvmcontainerv2'

// put the virtual machine into protected item
resource rVmBackup 'Microsoft.RecoveryServices/vaults/backupFabrics/protectionContainers/protectedItems@2016-06-01' = {
  name: '${rRecoveryServiceVault.name}/Azure/${vmProtectionContainerName}${rgName};${rVirtualMachine.name}/${vmProtectedItemName};${rgName};${rVirtualMachine.name}'
  properties: {
    protectedItemType: 'Microsoft.Compute/virtualMachines'
    policyId: rRecoveryServiceVaultBackupPolicy.id
    sourceResourceId: rVirtualMachine.id
  }
  dependsOn: [
    rBackupStorageConfig
  ]
}
}
