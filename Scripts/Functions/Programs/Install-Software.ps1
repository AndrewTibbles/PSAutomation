function Install-Software {
    param (
        [string]$client,
        [string]$site,
        [string]$logFilePath
    )

    # Validate client and site
    if (-not $clientSiteList.ContainsKey($client) -or -not $clientSiteList[$client].ContainsKey($site)) {
        Log-Message -message "Invalid client or site: Client=$client, Site=$site" -logFilePath $logFilePath
        return
    }

    $siteInfo = $clientSiteList[$client][$site]

    # Helper function to log and run installation scripts
    function Invoke-InstallScript {
        param (
            [string]$scriptPath,
            [string]$softwareName
        )

        $message = "Installing $softwareName for $client $site"
        Write-Output $message
        Log-Message -message $message -logFilePath $logFilePath

        if (Test-Path $scriptPath) {
            try {
                . $scriptPath -logFilePath $logFilePath
                Log-Message -message "$softwareName installation completed for $client $site" -logFilePath $logFilePath
            }
            catch {
                Log-Message -message "Error during $softwareName installation: $_" -logFilePath $logFilePath
            }
        }
        else {
            Log-Message -message "$softwareName installation script not found at $scriptPath." -logFilePath $logFilePath
        }
    }

    # Fetch program installer paths from config.json
    $chromeInstallScriptPath = $config.ProgramPaths.Chrome
    $adobeInstallScriptPath = $config.ProgramPaths.AdobeReader
    $officeInstallScriptPath = $config.ProgramPaths.Office365
    $slackInstallScriptPath = $config.ProgramPaths.Slack
    $supportAgentInstallScriptPath = $config.ProgramPaths.SupportAgent

    # Update all installed packages
    winget upgrade --all --include-unknown --accept-package-agreements

    # Install Chrome
    if ($siteInfo.InstallChrome) {
        Invoke-InstallScript -scriptPath $chromeInstallScriptPath -softwareName "Chrome"
        Log-Message -message "$chromeInstallScriptPath"
    }

    # Install Adobe Reader
    if ($siteInfo.InstallAdobeReader) {
        Invoke-InstallScript -scriptPath $adobeInstallScriptPath -softwareName "Adobe Reader"
    }

    # Install Office
    if ($siteInfo.InstallOffice) {
        Invoke-InstallScript -scriptPath $officeInstallScriptPath -softwareName "Office"
    }

    # Install Slack
    if ($siteInfo.InstallSlack) {
        Invoke-InstallScript -scriptPath $slackInstallScriptPath -softwareName "Slack"
    }

    # Install Support Agent
    if ($siteInfo.InstallSupportAgent) {
        Invoke-InstallScript -scriptPath $supportAgentInstallScriptPath -softwareName "Support Agent"
    }

    # Get the agent path from clientList.ps1
    $agentDirectory = [System.IO.Path]::GetDirectoryName($siteInfo.Agent)
    $agentPath = Get-ChildItem -Path $agentDirectory -Filter "*agent*.exe" | Select-Object -First 1
    
    $relativeAgentPath = $agentPath.FullName.Replace($parentFolder, ".")
    $message = "Installing Agent for $client $site from $relativeAgentPath"
    Write-Output $message
    Log-Message -message $message -logFilePath $logFilePath

    if ($agentPath) {
        try {
            Start-Process $agentPath.FullName -ArgumentList "/silent /install" -Wait
            Log-Message -message "Agent installation completed for $client $site" -logFilePath $logFilePath
        }
        catch {
            Log-Message -message "Error during Agent installation: $_" -logFilePath $logFilePath
        }
    }
    else {
        Log-Message -message "Agent executable not found in $agentDirectory." -logFilePath $logFilePath
    }

}
