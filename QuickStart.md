## Run the terraform root module 

### Deploy With different  azure environments

1. upgrade the terraform root
```powershell
# cd to the root module
$env:PROJ_ROOT="C:\Users\yingdingwang\Documents\VCS\local\azuretemplates"
$env:MODULE_ROOT="$env:PROJ_ROOT\root"
cd "$env:MODULE_ROOT";
terraform init -upgrade;
```

2. set the connection info in `/envs` to plan

```powershell
.\run-terraform.ps1 -envFilePath "C:\Users\yingdingwang\Documents\VCS\local\azuretemplates\envs\nonprod.env" -varFilePath "C:\Users\yingdingwang\Documents\VCS\local\azuretemplates\root\nonprod.tfvars" -cmdAction "plan"
```
Notice:
* from office, no vpn necessary

The options of `cmdAction` are `plan`, `apply`, `destroy` and ``validate` 

3. deploy with terraform apply
```powershell
.\run-terraform.ps1 -envFilePath "C:\Users\yingdingwang\Documents\VCS\local\azuretemplates\envs\nonprod.env" -varFilePath "C:\Users\yingdingwang\Documents\VCS\local\azuretemplates\root\nonprod.tfvars" -cmdAction "apply" 
```

## Create Azure Access Credentials
Please create principles for your azure subscriptions and create the envFilePath under `<repository>\envs\` folder and pass it to the `-envFilePath` arg for the `run-terraform.ps1`

Use the powershell 7.x version.

