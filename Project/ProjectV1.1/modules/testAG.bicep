targetScope = 'resourceGroup'
param IYAppGateway string = 'myAppGateway-${environment}'
param publicIPAddresses_myAGPublicIPAddress_name string = 'myAGPublicIPAddress-${environment}'

param location string = resourceGroup().location
param frontend_sub_id_in string
param environment string

@secure()
param certpass string 


resource frontag_ip_link 'Microsoft.Network/publicIPAddresses@2020-11-01' = {
  name: publicIPAddresses_myAGPublicIPAddress_name
  location: location
  zones: [
    '1'
  ]
  sku: {
    name: 'Standard'
    tier: 'Regional'
  }
  properties: {
    publicIPAddressVersion: 'IPv4'
    publicIPAllocationMethod: 'Static'
    idleTimeoutInMinutes: 4
  }
}

resource IAppGateway 'Microsoft.Network/applicationGateways@2020-11-01' = {
  name: IYAppGateway
  location: location
  zones: [
    '1'
  ]
  properties: {
    sku: {
      name: 'Standard_v2'
      tier: 'Standard_v2'
      capacity: 2
    }
    gatewayIPConfigurations: [
      {
        name: 'appGatewayFrontendIP'
        properties: {
          subnet: {
            id: frontend_sub_id_in
          }
        }
      }
    ]
    sslCertificates: [
      {
        name: '${IYAppGateway}SslCert'
        properties: {
          data: loadFileAsBase64('./Certificates/YassinSSLCert.pfx')
          password: certpass
        }
      }
    ]
    authenticationCertificates: []
    frontendIPConfigurations: [
      {
        name: 'appGatewayFrontendIP'
        properties: {
          privateIPAllocationMethod: 'Dynamic'
          publicIPAddress: {
            id: frontag_ip_link.id
          }
        }
      }
    ]
    frontendPorts: [
      {
        name: 'appGatewayFrontendPort'
        properties: {
          port: 443
        }
      }
      {
        name: 'httpPort'
        properties: {
          port: 80
        }
      }
    ]
    backendAddressPools: [
      {
        name: 'appGatewayBackendPool'
        properties: {
          backendAddresses: []
        }
      }
    ]
    backendHttpSettingsCollection: [
      {
        name: 'appGatewayBackendHttpSettings'
        properties: {
          port: 80
          protocol: 'Http'
          cookieBasedAffinity: 'Disabled'
          connectionDraining: {
            enabled: false
            drainTimeoutInSec: 1
          }
          pickHostNameFromBackendAddress: false
          requestTimeout: 30
        }
      }
    ]
    httpListeners: [
      {
        name: 'appGatewayHttpListener'
        properties: {
          frontendIPConfiguration: {
            id: resourceId('Microsoft.Network/applicationGateways/frontendIPConfigurations/', IYAppGateway, 'appGatewayFrontendIP')
          }
          frontendPort: {
            id: resourceId('Microsoft.Network/applicationGateways/frontendPorts/', IYAppGateway, 'appGatewayFrontendPort')
          }
          protocol: 'Https'
          sslCertificate: {
            id: resourceId('Microsoft.Network/applicationGateways/sslCertificates/', IYAppGateway, '${IYAppGateway}SslCert')
          }
          hostNames: []
          requireServerNameIndication: false
        }
      }
      {
        name: 'myListener'
        properties: {
          frontendIPConfiguration: {
            id: resourceId('Microsoft.Network/applicationGateways/frontendIPConfigurations/', IYAppGateway, 'appGatewayFrontendIP')
          }
          frontendPort: {
            id: resourceId('Microsoft.Network/applicationGateways/frontendPorts/', IYAppGateway, 'httpPort')
          }
          protocol: 'Http'
          hostNames: []
          requireServerNameIndication: false
        }
      }
    ]
    urlPathMaps: []
    requestRoutingRules: [
      {
        name: 'rule1'
        properties: {
          ruleType: 'Basic'
          httpListener: {
            id: resourceId('Microsoft.Network/applicationGateways/httpListeners/', IYAppGateway, 'appGatewayHttpListener')
          }
          backendAddressPool: {
            id: resourceId('Microsoft.Network/applicationGateways/backendAddressPools/', IYAppGateway, 'appGatewayBackendPool')
          }
          backendHttpSettings: {
            id: resourceId('Microsoft.Network/applicationGateways/backendHttpSettingsCollection/', IYAppGateway, 'appGatewayBackendHttpSettings')
          }
        }
      }
      {
        name: 'rule2'
        properties: {
          ruleType: 'Basic'
          httpListener: {
            id: resourceId('Microsoft.Network/applicationGateways/httpListeners/', IYAppGateway, 'myListener')
          }
          redirectConfiguration: {
            id: resourceId('Microsoft.Network/applicationGateways/redirectConfigurations/', IYAppGateway, 'httpToHttps')
          }
        }
      }
    ]
    probes: []
    rewriteRuleSets: []
    redirectConfigurations: [
      {
        name: 'httpToHttps'
        properties: {
          redirectType: 'Permanent'
          targetListener: {
            id: resourceId('Microsoft.Network/applicationGateways/httpListeners/', IYAppGateway, 'appGatewayHttpListener')
          }
          includePath: true
          includeQueryString: true
          requestRoutingRules: [
            {
              id: resourceId('Microsoft.Network/applicationGateways/requestRoutingRules/', IYAppGateway, 'rule2')
            }
          ]
        }
      }
    ]
  }
}


output backendpool_out string = IAppGateway.properties.backendAddressPools[0].id
