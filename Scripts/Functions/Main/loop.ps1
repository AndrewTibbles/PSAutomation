param (
    [string]$inputClient,
    [string]$logFilePath
)

# Check if the input matches a client in the hashtable
if ($clientSiteList.ContainsKey($inputClient)) {
    # Loop through each site for the matched client
    foreach ($site in $clientSiteList[$inputClient].Keys) {
        $filePath = $clientSiteList[$inputClient][$site]
        if (Test-Path $filePath) {
            $logMessage = "  Site: $site - Path: $filePath"
        } else {
            $logMessage = "  Site: $site - Path: $filePath (File not found)"
        }
        Add-Content -Path $logFilePath -Value $logMessage
    }
} else {
    $logMessage = "Client not found."
    Add-Content -Path $logFilePath -Value $logMessage
}