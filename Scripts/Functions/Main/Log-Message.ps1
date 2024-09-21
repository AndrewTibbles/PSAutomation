# Function to log messages
function Log-Message {
    param (
        [string]$message
    )

    # Check if $config is defined and contains logFilePath
    if (-not $config -or -not $config.logFilePath) {
        Write-Error "Configuration or log file path is not defined."
        return
    }

    $logFilePath = $config.logFilePath

    # Validate the message parameter
    if ([string]::IsNullOrWhiteSpace($message)) {
        Write-Error "Message cannot be null or empty."
        return
    }

    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    $logEntry = "$timestamp - $message"

    try {
        Add-Content -Path $logFilePath -Value $logEntry
    } catch {
        Write-Error "Failed to write to log file: $_"
    }
}
