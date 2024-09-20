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

# Clear the log file if it already exists
if (Test-Path $logFilePath) {
    Clear-Content -Path $logFilePath
}
else {
    # Create the log file if it doesn't exist
    New-Item -Path $logFilePath -ItemType File -Force
}

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
