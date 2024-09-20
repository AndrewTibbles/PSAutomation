param (
    [string]$configFilePath
)

# Load the JSON configuration file with validation
try {
    $config = Get-Content -Path $configFilePath -Raw | ConvertFrom-Json
    Log-Message "Successfully loaded config.json from $configFilePath"
} catch {
    Log-Message "Failed to load config.json from ${configFilePath}: $_"
    throw "Failed to load config.json from ${configFilePath}"
}

# Validate logFilePath
if (-not $config.logFilePath) {
    Log-Message "logFilePath is missing in config.json"
    throw "logFilePath is missing in config.json"
}

# Validate pcNameMapping
if (-not $config.pcNameMapping) {
    Log-Message "pcNameMapping is missing in config.json"
    throw "pcNameMapping is missing in config.json"
}

return $config
