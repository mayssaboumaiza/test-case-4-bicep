param location string
param projectName string
param subnetId string

resource vm "Microsoft.Compute/virtualMachines@2023-09-01" = {
  name: "${projectName}-vm"
  location: location
  properties: {
    hardwareProfile: { vmSize: "Standard_B2s" }
    storageProfile: {
      imageReference: {
        publisher: "Canonical"
        offer: "UbuntuServer"
        sku: "22_04-lts"
        version: "latest"
      }
    }
    networkProfile: {
      networkInterfaces: [{ id: nic.id }]
    }
    osProfile: {
      computerName: "${projectName}-vm"
      adminUsername: "azureuser"
    }
  }
}
resource nic "Microsoft.Network/networkInterfaces@2023-04-01" = {
  name: "${projectName}-nic"
  location: location
  properties: {
    ipConfigurations: [{
      name: "ipconfig1"
      properties: { subnet: { id: subnetId }, privateIPAllocationMethod: "Dynamic" }
    }]
  }
}
