param (
    [string]$configFilePath = "$PSScriptRoot\Configuration\config.json"
)

# Import functions
. "$PSScriptRoot\Functions\Main\Log-Message.ps1"
. "$PSScriptRoot\Functions\Main\Get-HardwareDetails.ps1"
. "$PSScriptRoot\Functions\Programs\Install-Software.ps1"

# Load configuration
try {
    if (-not (Test-Path -Path $configFilePath)) {
        throw "Configuration file not found: $configFilePath"
    }

    $configContent = Get-Content -Path $configFilePath -Raw
    $config = $configContent | ConvertFrom-Json

    Write-Output "Loaded configuration: $($config | Out-String)"
} catch {
    Write-Output "Failed to load configuration: $_"
    exit 1
}

$logFilePath = $config.logFilePath
$pcNameMapping = $config.pcNameMapping
$softwarePaths = $config.softwarePaths

Write-Output "PC Name Mapping: $($pcNameMapping | Out-String)"

# Ensure $logFilePath is not empty
if ([string]::IsNullOrEmpty($logFilePath)) {
    throw "The log file path cannot be empty."
}

# Ensure the directory for the log file exists
$logDirectory = Split-Path -Path $logFilePath -Parent
if (-not (Test-Path $logDirectory)) {
    New-Item -Path $logDirectory -ItemType Directory -Force
}

# Test the imported functions
try {
    Log-Message -message "Testing Log-Message function" -logFilePath $logFilePath
    Write-Output "Log-Message function imported successfully."
} catch {
    Write-Output "Failed to import Log-Message function: $_"
}

try {
    Get-HardwareDetails -logFilePath $logFilePath
    Write-Output "Get-HardwareDetails function imported successfully."
} catch {
    Write-Output "Failed to import Get-HardwareDetails function: $_"
}

try {
    Install-Software -client "TestClient" -site "TestSite" -logFilePath $logFilePath
    Write-Output "Install-Software function imported successfully."
} catch {
    Write-Output "Failed to import Install-Software function: $_"
}

# Verify configuration variables
if ($null -eq $logFilePath -or [string]::IsNullOrEmpty($logFilePath)) {
    Write-Output "logFilePath is not set correctly."
} else {
    Write-Output "logFilePath is set to: $logFilePath"
}

if ($null -eq $pcNameMapping -or $pcNameMapping.Count -eq 0) {
    Write-Output "pcNameMapping is not set correctly."
} else {
    Write-Output "pcNameMapping is set correctly."
}

if ($null -eq $softwarePaths -or $softwarePaths.Count -eq 0) {
    Write-Output "softwarePaths is not set correctly."
} else {
    Write-Output "softwarePaths is set correctly."
}

# Determine device type
$GetPCName = "ILUXCAM-LT59"  # Example PC name, replace with actual value
$deviceType = if ($GetPCName -match "-WS") {
    "Desktop"
} elseif ($GetPCName -match "-LT") {
    "Laptop"
} else {
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
$clientSiteList = @{
    'BoilerJuice' = @{
        'Cambridge' = $true
    },
    'ILUX' = @{
        'Cambridge' = $true
    }
}

if ($clientSiteList.ContainsKey($client) -and $clientSiteList[$client].ContainsKey($site)) {
    Install-Software -client $client -site $site -logFilePath $logFilePath
} else {
    $message = "Invalid client and site code: $client $site"
    Write-Output $message
    Log-Message -message $message -logFilePath $logFilePath
}

# Log the start of the process
Log-Message -message "Process started at $(Get-Date)" -logFilePath $logFilePath

# Log the end of the process
Log-Message -message "Process completed at $(Get-Date)" -logFilePath $logFilePath