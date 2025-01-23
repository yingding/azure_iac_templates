## Run the terraform root module 

### Deploy With different  azure environments

1. upgrade the terraform root
```powershell
# cd to the root module
$env:WORK_DIR= "<your project workdir>"
$env:PROJ_ROOT="$env:WORK_DIR\azure_iac_templates"
$env:MODULE_ROOT="$env:PROJ_ROOT\root"
cd "$env:MODULE_ROOT";
# init terraform
terraform init -upgrade;
```

2. set the connection info in `/envs` to plan

**Note**: cd to the root module first

```powershell
cd "$env:MODULE_ROOT";
.\run-terraform.ps1 -envFilePath "$env:PROJ_ROOT\envs\nonprod.env" -varFilePath "$env:PROJ_ROOT\root\nonprod.tfvars" -cmdAction "plan"
```
Notice:
* from office, no vpn necessary

The options of `cmdAction` are `plan`, `apply`, `destroy` and ``validate` 

3. deploy with terraform apply
```powershell
cd "$env:MODULE_ROOT";
.\run-terraform.ps1 -envFilePath "$env:PROJ_ROOT\envs\nonprod.env" -varFilePath "$env:PROJ_ROOT\root\nonprod.tfvars" -cmdAction "apply" 
```

## Create Azure Access Credentials
Please create principles for your azure subscriptions and create the envFilePath under `<repository>\envs\` folder and pass it to the `-envFilePath` arg for the `run-terraform.ps1`

Use the powershell 7.x version.

