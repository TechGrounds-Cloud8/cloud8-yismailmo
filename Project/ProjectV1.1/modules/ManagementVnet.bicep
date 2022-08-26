// Set parameters //
targetScope = 'resourceGroup'

param location string = resourceGroup().location


param ManagementVmName string = 'ManagementVm'
param adminUsername1 string = 'Admin-2311'

@description('Password for the Virtual Machine.')
@minLength(6)
@secure()
param adminPassword1 string

param OSVersion string = '2019-Datacenter'
param vmSize1 string = 'Standard_B1s'
param dnsLabelPrefix1 string = toLower('adminManage-vm-${uniqueString(resourceGroup().id)}')
param sourceAddressPrefix string = '84.86.21.149' /*(Home ip)*/
param virtualNetworkName string = 'ManagementVnet'
param nicName1 string = 'adminnic'
var subnet1Name = 'subnet-1'
var vnet1Config = {
  addressSpacePrefix: '10.10.10.0/24'
  subnet1Name: 'admsubnet'
  subnetPrefix: '10.10.10.0/24'
}

var nsgName = 'adminNSG'
var publicIPAddressName = 'AdminPublicIP'

// Management Vnet //

resource Managementvnet 'Microsoft.Network/virtualNetworks@2020-06-01' = {
  name: virtualNetworkName
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.10.10.0/24'
      ]
    }
    subnets: [
      {
        name: subnet1Name
        properties: {
          addressPrefix: '10.10.10.0/24'
        }  
        
      }
    ]
  }
}


// NIC//
resource nic1 'Microsoft.Network/networkInterfaces@2020-06-01' = {
  name: nicName1
  location: location
  properties: {
    ipConfigurations: [
      {
        name: 'ipconfig1'
        properties: {
          subnet: {
            id: resourceId('Microsoft.Network/virtualNetworks/subnets', Managementvnet.name, subnet1Name)
          }
          privateIPAllocationMethod: 'Dynamic'
          publicIPAddress: {
            id: pip.id
          }
        }
      }
    ]
    networkSecurityGroup: {
      id: nsg.id
    }
  }
}

// NSG //

resource nsg 'Microsoft.Network/networkSecurityGroups@2020-06-01' = {
  name: nsgName
  location: location
  properties: {
    securityRules: [
      {
        name: 'Deny-Inbound-All'
        properties: {
          priority: 4096
          protocol: 'Tcp'
          access: 'Deny'
          direction: 'Outbound'
          sourceAddressPrefix: sourceAddressPrefix
          sourcePortRange: '*'
          destinationAddressPrefix: '*'
          destinationPortRange: '22'
        }
      }
      {
        name: 'Allow-Inbound-Trusted'
        properties: {
          description: 'Allow Inbound from Trusted IPs'
          protocol: 'Tcp'
          sourcePortRange: '*'
          destinationPortRange: '3389'
          sourceAddressPrefix: sourceAddressPrefix
          destinationAddressPrefix: '10.20.20.0/24'
          access: 'Allow'
          priority: 110
          direction: 'Inbound'
        }
      }
    ]
  }
}


//PUBLIC IP
resource pip 'Microsoft.Network/publicIPAddresses@2020-06-01' = {
  name: publicIPAddressName
  location: location
  zones: [
    '1'
  ]
  sku: {
    name: 'Basic'
  }
  properties: {
    publicIPAllocationMethod: 'Static'
    publicIPAddressVersion: 'IPv4'
    dnsSettings: {
      domainNameLabel: dnsLabelPrefix1
    }
    idleTimeoutInMinutes: 4
  }
}


// VM (WINDOWS)
resource MngVm 'Microsoft.Compute/virtualMachines@2021-03-01' = {
  name: ManagementVmName
  location: location
  zones: [
    '1'
  ]
  properties: {
    hardwareProfile: {
      vmSize: vmSize1
    }
    osProfile: {
      computerName: ManagementVmName
      adminUsername: adminUsername1
      adminPassword: adminPassword1
    }
    storageProfile: {
      imageReference: {
        publisher: 'MicrosoftWindowsServer'
        offer: 'WindowsServer'
        sku: OSVersion
        version: 'latest'
      }
      osDisk: {
        name:'adminvmstorage'
        createOption: 'FromImage'
        managedDisk: {
          storageAccountType: 'StandardSSD_LRS'
          /*diskEncryptionSet: {
            id: dskEncrKey.id
          }*/
        }
      }
    }
    networkProfile: {
      networkInterfaces: [
        {
          id: nic1.id
        }
      ]
    }
  }
}






