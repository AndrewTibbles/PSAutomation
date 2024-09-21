param (
    [string]$configFilePath = "$PSScriptRoot\Configuration\config.json"
)

# Import functions
. "$PSScriptRoot\Functions\Main\Log-Message.ps1"
. "$PSScriptRoot\Functions\Main\Get-ClosestMatch.ps1"
. "$PSScriptRoot\Functions\Main\Get-HardwareDetails.ps1"
. "$PSScriptRoot\Functions\Programs\Install-Software.ps1"
. "$PSScriptRoot\Configuration\clientList.ps1"

# Load configuration
$config = . "$PSScriptRoot\Functions\Main\Load-Config.ps1" -configFilePath $configFilePath
Write-Output "Loaded configuration: $($config | Out-String)"

# Validate configuration
if (-not $config -or -not $config.logFilePath -or -not $config.pcNameMapping) {
    Write-Error "Configuration is invalid or missing required properties."
    exit
}

# Define the log file path from the configuration
$logFilePath = $config.logFilePath

# Clear the log file if it already has content
if (Test-Path $logFilePath) {
    Clear-Content -Path $logFilePath
} else {
    New-Item -Path $logFilePath -ItemType File
}

# Function to clean up the log file
function Clean-LogFile {
    param (
        [string]$filePath
    )
    $content = Get-Content -Path $filePath
    $cleanedContent = $content | Where-Object { $_ -notmatch '^\s*[-\\|]\s*$' -and $_ -ne '' }
    Set-Content -Path $filePath -Value $cleanedContent
}

# Convert pcNameMapping
$pcNameMapping = . "$PSScriptRoot\Functions\Main\Convert-PcNameMapping.ps1" -pcNameMappingConfig $config.pcNameMapping

# Add header to the log file
$header = @"
************************************************************************************
**                           STARTING ILUX AUTOMATED CONFIGURATION                **
************************************************************************************
"@
Add-Content -Path $logFilePath -Value $header
Log-Message -message "The setup process has begun..."

# Clean the log file
Clean-LogFile -filePath $logFilePath

# Get current PC name
$pcName = . "$PSScriptRoot\Functions\Main\Get-PcName.ps1"
Log-Message -message "Current PC name: $pcName"

# Find the closest match for the current PC name with validation
try {
    $closestMatch = Get-ClosestMatch -name $pcName -mapping $pcNameMapping
    if ($closestMatch) {
        $clientInfo = $pcNameMapping[$closestMatch]
        $client = $clientInfo.Client
        $site = $clientInfo.Site

        Write-Output "Client: $client"
        Write-Output "Site: $site"
        Log-Message -message "Match found: Client=$client, Site=$site"
        Log-Message -message "Mapped PC Name to Client: $client, Site: $site `n"

        # Install software based on client and site
        Install-Software -client $client -site $site -logFilePath $logFilePath
    } else {
        Write-Output "No matching client and site found for PC name: $pcName"
        Log-Message -message "No matching client and site found for PC name: $pcName"
        Log-Message -message "Invalid client and site for PC name: $pcName"
    }
} catch {
    Log-Message -message "Error finding match: $_"
    throw "Error finding match"
}
# Clean the log file
Clean-LogFile -filePath $logFilePath