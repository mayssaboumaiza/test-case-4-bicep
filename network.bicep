param location string
param projectName string

resource vnet "Microsoft.Network/virtualNetworks@2023-04-01" = {
  name: "${projectName}-vnet"
  location: location
  properties: {
    addressSpace: { addressPrefixes: ["10.0.0.0/16"] }
    subnets: [{
      name: "default"
      properties: { addressPrefix: "10.0.1.0/24" }
    }]
  }
}
output subnetId string = vnet.properties.subnets[0].id
