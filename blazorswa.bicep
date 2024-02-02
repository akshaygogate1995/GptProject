param location string = resourceGroup().location
param name string = uniqueString(resourceGroup().id)

param asw_BlazorApp_name string = 'BlazorApp'  // Update with your Blazor app name
param githubRepositoryUrl string = 'https://github.com/yourusername/your-blazor-app-repo'  // Update with your GitHub repo URL
param appLocation string = 'src/BlazorApp'  // Update with the location of your Blazor app source code
param apiLocation string = 'src/Api'  // Update with the location of your API source code
param outputLocation string = 'dist'  // Update with the location where your build artifacts are placed

resource asw_BlazorApp 'Microsoft.Web/staticSites@2022-09-01' = {
  name: '${name}_BlazorApp'
  location: location
  sku: {
    name: 'Free'
    tier: 'Free'
  }
  properties: {
    repositoryUrl: githubRepositoryUrl
    branch: 'main'  // Update with your desired branch
    appArtifactLocation: appLocation
    apiArtifactLocation: apiLocation
    outputLocation: outputLocation
    apiType: 'FunctionApp'  // This assumes you have Azure Functions in your Blazor app
    publishCredential: {
      actionName: 'Bicep Deploy'  // Update as needed
    }
    provider: 'GitHub'
    enterpriseGradeCdnStatus: 'Disabled'
  }
}
