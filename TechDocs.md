# About 
About this infra bicep folder to deploy on Azure.

There are app deployment resource bicep files:
* main.bicep
* resources.bicep


The module `resources.bicep` defines all the resources.
The module `main.bicep` is calling the `resources.bicep` with pre-defined parameters.
The terraform module (1.7.5) on azure cloud shell

## install terraform
https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli

## deploy the dev env from azure cloud shell
There develop tenent environment resources for the development in addition to the app resources

```powershell
$env:WORKDIR = "$HOME\Documents\VCS\local\azureinfras\nonprod"; 
cd $env:WORKDIR;
```

```shell
terraform init
terraform init -upgrade
terraform plan
terraform apply
```

## Terraform mit Azure

Reference:
* https://developer.hashicorp.com/terraform/tutorials/azure-get-started/azure-build

## Create a principle
 A Service Principal is an application within Azure Active Directory with the authentication tokens Terraform needs to perform actions on your behalf. Update the `<SUBSCRIPTION_ID>` with the subscription ID you specified in the previous step.

```powershell
$env:SUB_ID = "";
az ad sp create-for-rbac --role="Contributor" --scopes="/subscriptions/$env:SUB_ID";
```

```powershell
$Env:ARM_CLIENT_ID = "<APPID_VALUE>"
$Env:ARM_CLIENT_SECRET = "<PASSWORD_VALUE>"
$Env:ARM_SUBSCRIPTION_ID = "<SUBSCRIPTION_ID>"
$Env:ARM_TENANT_ID = "<TENANT_VALUE>"
```

## List Powershell Env variables
```
Get-ChildItem Env:
```

## Passing Terraform provider info with ephemeral variables

Reference:
* https://discuss.hashicorp.com/t/how-can-we-change-provider-settings-during-terraform-apply-with-plan-files/71906/5

## Run the terraform with different environments to deploy
```powershell
.\run-terraform.ps1 -envFilePath "C:\Users\yingdingwang\Documents\VCS\local\azureinfras\nonprod\envs\nonprod.env" -cmdAction "plan"
```
Notice:
* from office, no vpn necessary

The options of `cmdAction` are `plan`, `apply`, `destroy`. 

## Upgrade terraform providers
```powershell
terraform init -upgrade
```




