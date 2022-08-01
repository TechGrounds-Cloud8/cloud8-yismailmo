targetScope = 'subscription'

param location string = 'Northeurope'

var ResourceGroupName = 'V1AzProject'

resource RG 'Microsoft.Resources/resourceGroups@2021-04-01' = {
 
  name:ResourceGroupName
  location:location
}

output V1AzProject string = RG.id
output resourceGroupName string = RG.name
