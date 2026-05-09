param location string = 'westeurope'
param environment string = 'prod'
param projectName string = 'webapp'

module network './network.bicep' = {
  name: 'networkDeploy'
  params: { location: location, projectName: projectName }
}
module compute './compute.bicep' = {
  name: 'computeDeploy'
  params: { location: location, projectName: projectName, subnetId: network.outputs.subnetId }
  dependsOn: [network]
}
module storage './storage.bicep' = {
  name: 'storageDeploy'
  params: { location: location, projectName: projectName }
}
