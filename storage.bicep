param location string
param projectName string

resource storageAccount "Microsoft.Storage/storageAccounts@2023-01-01" = {
  name: "${projectName}storage${uniqueString(resourceGroup().id)}"
  location: location
  kind: "StorageV2"
  sku: { name: "Standard_LRS" }
}
resource cosmosDb "Microsoft.DocumentDB/databaseAccounts@2023-04-15" = {
  name: "${projectName}-cosmos"
  location: location
  kind: "GlobalDocumentDB"
  properties: {
    databaseAccountOfferType: "Standard"
    locations: [{ locationName: location, failoverPriority: 0 }]
  }
}
