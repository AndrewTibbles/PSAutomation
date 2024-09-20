function Log-Message {
    param (
        [string]$message,
        [string]$logFilePath
    )
    $timestamp = Get-Date -Format "dd-MM-yyy HH:mm:ss"
    $logEntry = "[$timestamp] $message"
    Add-Content -Path $logFilePath -Value $logEntry
}
