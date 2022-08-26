targetScope = 'resourceGroup'

@description('Location of the resources')
param location string = resourceGroup().location

@description('Set the local VNet name')
param existingLocalVirtualNetworkName string = 'Managementvnet'

@description('Set the remote VNet name')
param existingRemoteVirtualNetworkName string = 'WebVNet'

@description('Sets the remote VNet Resource group')
var existingRemoteVirtualNetworkResourceGroupName = 'V1AzProject'
var existingLocalVirtualNetworkResourceGroupName = 'V1AzProject'

resource existingLocalVirtualNetworkName_peering_to_remote_vnet 'Microsoft.Network/virtualNetworks/virtualNetworkPeerings@2021-02-01' = {
  name: '${existingLocalVirtualNetworkName}/peering-to-remote-vnet'
  properties: {
    allowVirtualNetworkAccess: true
    allowForwardedTraffic: false
    allowGatewayTransit: false
    useRemoteGateways: false
    remoteVirtualNetwork: {
      id: resourceId(existingRemoteVirtualNetworkResourceGroupName, 'Microsoft.Network/virtualNetworks', existingRemoteVirtualNetworkName)
    }
  }
}


resource existingRemoteVirtualNetworkName_peering_to_remote_vnet 'Microsoft.Network/virtualNetworks/virtualNetworkPeerings@2021-02-01' = {
  name: '${existingRemoteVirtualNetworkName}/peering-to-remote-vnet'
  properties: {
    allowVirtualNetworkAccess: true
    allowForwardedTraffic: false
    allowGatewayTransit: false
    useRemoteGateways: false
    remoteVirtualNetwork: {
      id: resourceId(existingLocalVirtualNetworkResourceGroupName, 'Microsoft.Network/virtualNetworks', existingLocalVirtualNetworkName)
    }
  }
}
