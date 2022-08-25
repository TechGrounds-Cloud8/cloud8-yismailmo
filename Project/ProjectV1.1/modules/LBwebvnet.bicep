// set parameter //

param location string = resourceGroup().location

@description('Size of VMs in the VM Scale Set.')
param vmSku string = 'Standard_B1ls'

@description('The Ubuntu version for the VM. This will pick a fully patched image of this given Ubuntu version.')
@allowed([
  '12.04.5-LTS'
  '14.04.5-LTS'
  '16.04.0-LTS'
  '18.04-LTS'
])
param ubuntuOSVersion string = '18.04-LTS'
var osDiskType = 'Standard_LRS'

param vmName string = 'webVM'
@description('The size of the VM')
param vmSize string = 'Standard_B1ls'

@description('String used as a base for naming resources. Must be 3-61 characters in length and globally unique across Azure. A hash is prepended to this string for some resources, and resource-specific information is appended.')
@maxLength(61)
param vmssName string = 'vmscaleset1'

@description('Number of VM instances (100 or less).')
@minValue(1)
@maxValue(100)
param instanceCount int = 3

@description('Admin username on all VMs.')
param adminUsername string

@description('Admin password on all VMs.')
@secure()
param adminPassword string

param vaultName string = 'vault'
param LBBackendAddressPools array = []

// @description('Array of containing all load balancing rules.')
// param LBRules array = [
  
// ]

@description('Array of containing all load balancing probes.')
// param LBProbes array = []
param zones int = 1


@description('Scale-in policy')
param scaleInPolicy object = {
  rules: [
    'Default'
  ]
}
 
@description('Name of the Network Security Group')
param networkSecurityGroupName string = 'SecGroupNet'
@description('Load Balancer Backend Pool Id.')
param lbPoolID string
var backuppolicy_Name = 'backuppolicy'

var backupFabric = 'Azure'
var protectionContainer = 'iaasvmcontainer;iaasvmcontainerv2;${resourceGroup().name}'
var protectedItem = 'vmss;iaasvmcontainerv2;${resourceGroup().name}'

var namingInfix = toLower(substring('${vmName}${uniqueString(resourceGroup().id)}', 0, 9))
var longNamingInfix = toLower(vmName)
var addressPrefix = '10.20.20.0/24'
var subnetPrefix = '10.20.20.0/24'

var virtualNetworkName = '${namingInfix}vnet'
var publicIPAddressName = '${namingInfix}pip'
var subnetName = '${namingInfix}subnet'
var loadBalancerName = '${namingInfix}lb'
var natPoolName = '${namingInfix}natpool'
var bePoolName = '${namingInfix}bepool'

// var natStartPort = 50000
// var natEndPort = 50119
// var natBackendPort = 443
var nicName = '${namingInfix}nic'
var ipConfigName = '${namingInfix}ipconfig'

var osType = {
  publisher: 'Canonical'
  offer: 'UbuntuServer'
  sku: '18.04-LTS'
  version: 'latest'
}
var LBProbes  = [{
  
            name: 'probe1'
            protocol: 'Tcp'
            port: 80
            intervalInSeconds: 10
            numberOfProbes: 5
        }]
var LBRules = [{
  
        
            name: 'publicIPLBRule1'
            frontendPort: 8080
            backendPort: 8080
            probeName: 'probe1'
            backendAddressPoolName: 'pool1'
            protocol: 'Tcp'
        }]
 
var imageReference = osType

resource webvirtualNetwork 'Microsoft.Network/virtualNetworks@2021-02-01' = {
  name: virtualNetworkName
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        addressPrefix
      ]
    }
    subnets: [
      {
        name: subnetName
        properties: {
          addressPrefix: subnetPrefix
        }
      }
    ]
  }
}

resource publicIp 'Microsoft.Network/publicIPAddresses@2021-05-01' = {
  name: publicIPAddressName
  location: location
  sku: {
    name: 'Standard'
    tier: 'Regional'
  }
  zones: zones
  properties: {
    publicIPAllocationMethod: 'Static'
  }
}

resource loadBalancer 'Microsoft.Network/loadBalancers@2021-05-01' = {
  name: loadBalancerName
  location: location
  sku: {
    name: 'Standard'
  }
  properties: {
    frontendIPConfigurations: [
      {
        name: 'LoadBalancerFrontEnd'
        properties: {
          publicIPAddress: {
            id: publicIp.id
          }
        }
      }
    ]
    backendAddressPools: [for backendAddressPool in LBBackendAddressPools: {
      name: backendAddressPool.name
    }]
    loadBalancingRules: [for loadBalancingRule in LBRules: {
      name: loadBalancingRule.name
      properties: {
        frontendIPConfiguration: {
          id: az.resourceId('Microsoft.Network/loadBalancers/frontendIPConfigurations', loadBalancerName, 'LoadBalancerFrontEnd')
        }
        backendAddressPool: {
          id: az.resourceId('Microsoft.Network/loadBalancers/backendAddressPools', loadBalancerName, loadBalancingRule.backendAddressPoolName)
        }
        protocol: loadBalancingRule.protocol
        frontendPort: loadBalancingRule.frontendPort
        backendPort: loadBalancingRule.backendPort
        enableFloatingIP: false
        idleTimeoutInMinutes: 5
        probe: {
          id: '${az.resourceId('Microsoft.Network/loadBalancers', loadBalancerName)}/probes/${loadBalancingRule.probeName}'
        }
      }
    }]
    probes: [for probe in [LBProbes]: {
      name: 'probe'
      properties: {
        protocol: 'probe'
        port: 80
        intervalInSeconds: 10
        numberOfProbes: 5 
      }
    }]
  }
}


resource vmss 'Microsoft.Compute/virtualMachineScaleSets@2021-03-01' = {
  name: vmssName
  location: location
  sku: {
    name: vmSku
    tier: 'Standard'
    capacity: instanceCount
  }
  properties: {
    overprovision: true
    upgradePolicy: {
      mode: 'Manual'
    }
    virtualMachineProfile: {
      storageProfile: {
        osDisk: {
          createOption: 'FromImage'
          caching: 'ReadWrite'
        }
        imageReference: imageReference
      }
      osProfile: {
        computerNamePrefix: namingInfix
        adminUsername: adminUsername
        adminPassword: adminPassword
      }
      networkProfile: {
        networkInterfaceConfigurations: [
          {
            name: nicName
            properties: {
              primary: true
              ipConfigurations: [
                {
                  name: ipConfigName
                  properties: {
                    subnet: {
                      id: resourceId('Microsoft.Network/virtualNetworks/subnets', webvirtualNetwork.name, subnetName)
                    }
                    loadBalancerBackendAddressPools: [
                      {
                        id: resourceId('Microsoft.Network/loadBalancers/backendAddressPools', loadBalancer.name, bePoolName)
                      }
                    ]
                    loadBalancerInboundNatPools: [
                      {
                        id: resourceId('Microsoft.Network/loadBalancers/inboundNatPools', loadBalancer.name, natPoolName)
                      }
                    ]
                  }
                }
              ]
            }
          }
        ]
      }
    }
  }
}

resource autoScaleSettings 'microsoft.insights/autoscalesettings@2015-04-01' = {
  name: 'cpuautoscale'
  location: location
  properties: {
    name: 'cpuautoscale'
    targetResourceUri: vmss.id
    enabled: true
    profiles: [
      {
        name: 'Profile1'
        capacity: {
          minimum: '1'
          maximum: '3'
          default: '1'
        }
        rules: [
          {
            metricTrigger: {
              metricName: 'Percentage CPU'
              metricResourceUri: vmss.id
              timeGrain: 'PT1M'
              timeWindow: 'PT5M'
              timeAggregation: 'Average'
              operator: 'GreaterThan'
              threshold: 75
              statistic: 'Average'
            }
            scaleAction: {
              direction: 'Increase'
              type: 'ChangeCount'
              value: '1'
              cooldown: 'PT5M'
            }
          }
          {
            metricTrigger: {
              metricName: 'Percentage CPU'
              metricResourceUri: vmss.id
              timeGrain: 'PT1M'
              timeWindow: 'PT5M'
              timeAggregation: 'Average'
              operator: 'LessThan'
              threshold: 30
              statistic: 'Average'
            }
            scaleAction: {
              direction: 'Decrease'
              type: 'ChangeCount'
              value: '1'
              cooldown: 'PT5M'
            }
          }
        ]
      }
    ]
  }
}



resource nsg 'Microsoft.Network/networkSecurityGroups@2020-06-01' = {
  name: networkSecurityGroupName
  location: location
  properties: {
    securityRules: [
      {
        name: '"Deny-Inbound-All"'
        properties: {
          priority: 4096
          sourceAddressPrefix: '*'
          protocol: 'Tcp'
          destinationPortRange:  '*'
          access: 'Deny'
          direction: 'inbound'
          sourcePortRange: '*'
          destinationAddressPrefix: '*'
        }
      }

      {
        name: 'Allow-Inbound-Trusted'
        properties: {
          priority: 1100
          protocol: 'Tcp'
          access: 'Allow'
          direction: 'Inbound'
          sourceAddressPrefix: '10.10.10.0/24'
          sourcePortRange: '*'
          destinationAddressPrefix: '10.20.20.0/24'
          destinationPortRange: '22'
        }
      }
    ]
  }
}



    
resource recoverySvault 'Microsoft.RecoveryServices/vaults@2022-02-01' = {
  name: vaultName
  location: location
  sku: {
    name: 'RS0'
    tier: 'Standard'
  }
  properties: {}
}


resource vaultName_backupFabric_protectionContainer_protectedItem 'Microsoft.RecoveryServices/vaults/backupFabrics/protectionContainers/protectedItems@2022-03-01' = {
  name: '${vaultName}/${backupFabric}/${protectionContainer}/${protectedItem}'
  properties: {
    protectedItemType: 'Microsoft.Compute/virtualMachines'
    policyId: '${recoverySvault.id}/backupPolicies/${backuppolicy_Name}'
    sourceResourceId: vmss.id
  }
} 


//BACKUP_POLICY
resource backupPolicy 'Microsoft.RecoveryServices/vaults/backupPolicies@2022-03-01' = {
  parent: recoverySvault
  name: backuppolicy_Name
  location: location
  properties: {
    backupManagementType: 'AzureIaasVM'
    schedulePolicy: {
      scheduleRunFrequency: 'Daily'
      schedulePolicyType: 'SimpleSchedulePolicy'
      scheduleRunTimes: [
        '2022-03-17T00:30:00Z'
      ]
    }
    retentionPolicy: {
      retentionPolicyType: 'LongTermRetentionPolicy'
      dailySchedule: {
        retentionTimes: [
          '2022-03-17T00:30:00Z'
        ]
        retentionDuration: {
          count: 7
          durationType: 'Days'
        }
      }
    }
  }
}
