param (
    [string]$varFilePath = ".\nonprod.tfvars", # Default path to the nonprod.tfvars file
    [string]$envFilePath = ".\provider.env",  # Default path to the local.env file
    [string]$cmdAction = "plan"  # terraform action is plan, apply, destroy
)

# Define the path to the .env file
# $envFilePath = ".\nonprod.env"

# Check if the .env file exists
if (-Not (Test-Path $envFilePath)) {
    Write-Error "The file '$envFilePath' does not exist in the current directory."
    exit 1
} elseif (-Not (Test-Path $varFilePath)) {
    Write-Error "The file '$varFilePath' does not exist in the current directory."
    exit 1
}

# Read the .env file line by line
Get-Content $envFilePath | ForEach-Object {
    # Split the line into key-value pairs based on '='
    $line = $_ -split '='
    $key = $line[0].Trim()
    $value = $line[1].Trim()

    # Check if the key is 'name' and set it as an environment variable
    if ($key -eq 'subscription_id') {
        $env:subscription_id = $value
    } elseif ($key -eq 'tenant_id') {
        $env:tenant_id = $value
    } elseif ($key -eq 'client_id') {
        $env:client_id = $value
    } elseif ($key -eq 'client_secret') {
        $env:client_secret = $value
    }
}

# Verify if the 'name' variable is set
if (-Not $env:subscription_id) {
    Write-Error "The 'subscription_id' variable is not set in the '$env:FilePath' file."
    exit 1
}

# Validate the CmdAction parameter
$validActions = @("validate", "plan", "apply", "destroy")
if ($cmdAction -notin $validActions) {
    Write-Error "Invalid cmdAction '$cmdAction'. Valid actions are: $($validActions -join ', ')."
    exit 1
} else {
    # pass var for subscription_id, tenant_id, client_id, client_secret to terraform
    # break the cmd to multiple lines for better readability
    terraform $cmdAction `
        -var "subscription_id=$env:subscription_id" `
        -var "tenant_id=$env:tenant_id" `
        -var "client_id=$env:client_id" `
        -var "client_secret=$env:client_secret" `
        -var-file="$varFilePath"
    # terraform $cmdAction -var "subscription_id=$env:subscription_id" -var "tenant_id=$env:tenant_id" -var "client_id=$env:client_id" -var "client_secret=$env:client_secret"
}