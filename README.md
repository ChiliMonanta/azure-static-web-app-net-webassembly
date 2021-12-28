# Blazor WebAssembly - Hello world - Static Web Apps

This template contains an example [Blazor WebAssembly](https://docs.microsoft.com/aspnet/core/blazor/?view=aspnetcore-3.1#blazor-webassembly) client application, a C# [Azure Functions](https://docs.microsoft.com/azure/azure-functions/functions-overview) and a C# class library with shared code. The infrastructure is created with [bicep](https://docs.microsoft.com/en-us/azure/azure-resource-manager/bicep/).


## Folder structure

* **Client**: The Blazor WebAssembly sample application
* **API**:  A C# Azure Functions API, which the Blazor application will call
* **Shared**: A C# class library with a shared data model between the Blazor and Functions application
* **Infrastructure**: Infrastructure by code, a bicep template
* **.github/workflows7deploy**: A github actions for deployment

## Deployment
Before a deploy of static web apps code can be done, you have to create the infrastructure (see below). The github action needs a secret to be able to deploy to the static web app. Copy the deployment token (on the static web app overview) and create a secret in github called "AZURE_STATIC_WEB_APPS_API_TOKEN"

### Create infrastructure

First deploy infrastructure with biceps

```
az login
az account set --subscription <SUBSCRIPTION-ID-OR-SUBSCRIPTION-NAME>

resourceGroupName="<resource group name>"
az group create --name $resourceGroupName --location "westeurope"

az deployment group create \
--name DeployLocalTemplate-01 \
--resource-group $resourceGroupName \
--template-file main.bicep \
--parameters main.parameters.json \
--what-if \
--verbose
```

### Deploy to Azure Static Web Apps

At this time the only option is to deploy with github actions

Not supported:
* Deploy with vscode (works if you link static app is linked to github, this is not done in this example)
* Deploy with az cli (MS work in progress)