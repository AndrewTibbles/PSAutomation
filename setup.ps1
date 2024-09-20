param (
    [string]$configFilePath = "$PSScriptRoot\Configuration\config.json"
)

# Import functions
. "$PSScriptRoot\Functions\Main\Log-Message.ps1"
. "$PSScriptRoot\Functions\Main\Get-HardwareDetails.ps1"
. "$PSScriptRoot\Functions\Programs\Install-Software.ps1"

# Load configuration
$config = Get-Content -Path $configFilePath | ConvertFrom-Json
Write-Output "Loaded configuration: $($config | Out-String)"

$logFilePath = $config.logFilePath
$pcNameMapping = $config.pcNameMapping
$softwarePaths = $config.softwarePaths

Write-Output "PC Name Mapping: $($pcNameMapping | Out-String)"

# Ensure $logFilePath is not empty
if ([string]::IsNullOrEmpty($logFilePath)) {
    throw "The log file path cannot be empty."
}

# Import the client site list from clientList.ps1
. "$PSScriptRoot\Configuration\clientList.ps1"

# Ensure the directory for the log file exists
$logDirectory = Split-Path -Path $logFilePath -Parent
if (-not (Test-Path $logDirectory)) {
    New-Item -Path $logDirectory -ItemType Directory -Force
}

# Clear the log file if it already exists
if (Test-Path $logFilePath) {
    Clear-Content -Path $logFilePath
}
else {
    # Create the log file if it doesn't exist
    New-Item -Path $logFilePath -ItemType File -Force
}

# Add header to the log file
$header = @"
************************************************************************************
**                           STARTING ILUX AUTOMATED CONFIGURATION                **
************************************************************************************
The setup process has begun...
"@
Add-Content -Path $logFilePath -Value $header

# Set the PC name variable
$GetPCName = [System.Net.DNS]::GetHostByName($Null).HostName
$pcNameMessage = "PC Name: $GetPCName"
Write-Output $pcNameMessage
Add-Content -Path $logFilePath -Value $pcNameMessage

# Debug logging to ensure PC name is retrieved
Log-Message -message "Retrieved PC Name: $GetPCName" -logFilePath $logFilePath

# Determine device type based on PC name
$deviceType = if ($GetPCName -match "-WS") {
    "Desktop"
}
elseif ($GetPCName -match "-LT") {
    "Laptop"
}
else {
    "Unknown"
}
$deviceTypeMessage = "Device Type: $deviceType"
Write-Output $deviceTypeMessage
Add-Content -Path $logFilePath -Value $deviceTypeMessage

# Log hardware details
Get-HardwareDetails -logFilePath $logFilePath

# Extract client and site from PC name
$matched = $false
foreach ($key in $pcNameMapping.Keys) {
    Log-Message -message "Checking key: $key against PC Name: $GetPCName" -logFilePath $logFilePath
    Write-Output "Checking key: $key against PC Name: $GetPCName"
    if ($GetPCName -like "*$key*") {
        $client = $pcNameMapping[$key].Client
        $site = $pcNameMapping[$key].Site
        $message = "Mapped PC Name to Client: $client, Site: $site `n"
        Write-Output $message
        Log-Message -message $message -logFilePath $logFilePath
        $matched = $true
        break
    }
}

if (-not $matched) {
    $message = "PC Name not found in mapping table: $GetPCName"
    Write-Output $message
    Log-Message -message $message -logFilePath $logFilePath
    exit 1
}

# Validate input
if ($clientSiteList.ContainsKey($client) -and $clientSiteList[$client].ContainsKey($site)) {
    Install-Software -client $client -site $site -logFilePath $logFilePath
}
else {
    $message = "Invalid client and site code: $client $site"
    Write-Output $message
    Log-Message -message $message -logFilePath $logFilePath
}

# Log the start of the process
Log-Message -message "Process started at $(Get-Date)" -logFilePath $logFilePath

# Log the end of the process
Log-Message -message "Process completed at $(Get-Date)" -logFilePath $logFilePath
