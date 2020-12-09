# hybrid-christmas
A simple project demonstrating how to set up a Azure Hybrid Connection(https://docs.microsoft.com/en-us/azure/app-service/app-service-hybrid-connections) between an Azure Web App Service and on-prem service.

## Prerequisites
- [Powershell 7](https://docs.microsoft.com/en-us/powershell/scripting/install/installing-powershell-core-on-windows?view=powershell-7.1)
- [.NET core 3.1](https://dotnet.microsoft.com/download/dotnet-core/3.1)
- [Visual Studio Code](https://code.visualstudio.com/download) or [Visual Studio 2019](https://visualstudio.microsoft.com/downloads/)
- Azure subscription with a serviceplan
- [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli)

## Infrastructure
Infrastructure is set up using Terraform (https://www.terraform.io/).
To provision the infrastructure:
1. If you don't have an azure subscription, create a free one here: https://portal.azure.com
1. Create a service plan in Azure using the approach described [here](https://docs.microsoft.com/en-us/azure/app-service/app-service-plan-manage).
1. Update `terraform.tfvars` with the id of your serviceplan in Azure

Now you are ready to provision the infrastructure.
Using a powershell-console in the root folder of the repository navigate to the terraform folder:
```
cd terraform
```
From this folder initialize terraform
```
terraform init
```
To provision the infrastructure
```
terraform apply -auto-approve
```
A successful provisioning of this should give a resource group in Azure called `rg-hybrid-christmas` with a web app service `app-hybrid-christmas-api` holding the the simple api of this repository.

**Important**: This terraform setup only uses a local backend, when using terraform in your team you should configure a terraform backend such as a Azure Storage or similiar: https://www.terraform.io/docs/backends/index.html

## Build
To build the project:
```
~\pipeline.ps1 Build
```
This will run `dotnet publish` and the output is available in **Build** folder.

## Deploy
To deploy the application:
```
~\pipeline.ps1 Deploy
```
This will build the project, create a zip of the application, and copy everything to the artifacts folder. Finally it will use Azure CLI to deploy the app to the resources created by Terraform.

## Projects

### Hybrid.Christmas.Api
Simple dotnet core api illustrating an api to be deployed in azure.

### On.North.Pole.Elves.Api
Simple dotnet core api illustrating the elves api to be deployed on-north-pole.