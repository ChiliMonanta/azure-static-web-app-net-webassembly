
param location string
param appName string
param repositoryUrl string
param repositoryBranch string

param skuName string = 'Free'
param skuTier string = 'Free'

resource staticWebApp 'Microsoft.Web/staticSites@2021-02-01' = {
  name: appName
  location: location
  tags: {
    environment: 'tagValue1'
    build: 'tagValue2'
  }
  sku: {
    name: skuName
    tier: skuTier
  }
  properties: {
    allowConfigFileUpdates: false
    stagingEnvironmentPolicy: 'Disabled'
    //repositoryUrl: repositoryUrl
    //branch: repositoryBranch
    buildProperties: {
      skipGithubActionWorkflowGeneration: true
    }
  }
}

//output deployment_token string = listSecrets(staticWebApp.id, staticWebApp.apiVersion).properties.apiKey
