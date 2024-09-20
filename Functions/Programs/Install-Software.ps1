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
    function Run-InstallScript {
        param (
            [string]$scriptPath,
            [string]$softwareName
        )

        $message = "`nInstalling $softwareName for $client $site"
        Write-Output $message
        Log-Message -message $message -logFilePath $logFilePath

        if (Test-Path $scriptPath) {
            try {
                . $scriptPath -logFilePath $logFilePath
                Log-Message -message "$softwareName installation completed for $client $site" -logFilePath $logFilePath
            } catch {
                Log-Message -message "Error during $softwareName installation: $_" -logFilePath $logFilePath
            }
        } else {
            Log-Message -message "$softwareName installation script not found at $scriptPath." -logFilePath $logFilePath
        }
    }

    # Fetch program installer paths from config.json
    $chromeInstallScriptPath = $config.ProgramPaths.Chrome
    $adobeInstallScriptPath = $config.ProgramPaths.AdobeReader
    $officeInstallScriptPath = $config.ProgramPaths.Office365
    $supportAgentInstallScriptPath = $config.ProgramPaths.SupportAgent

    # Install Chrome
    if ($siteInfo.InstallChrome) {
        Run-InstallScript -scriptPath $chromeInstallScriptPath -softwareName "Chrome"
        Log-Message -message "$chromeInstallScriptPath"
    }

    # Install Adobe Reader
    if ($siteInfo.InstallAdobeReader) {
        Run-InstallScript -scriptPath $adobeInstallScriptPath -softwareName "Adobe Reader"
    }

    # Install Office
    if ($siteInfo.InstallOffice) {
        Run-InstallScript -scriptPath $officeInstallScriptPath -softwareName "Office"
    }

    # Install Support Agent
    if ($siteInfo.InstallSupportAgent) {
        Run-InstallScript -scriptPath $supportAgentInstallScriptPath -softwareName "Support Agent"
    }

    # Get the agent path from clientList.ps1
    $agentPath = $siteInfo.Agent
    $message = "Installing Agent for $client $site"
    Write-Output $message
    Log-Message -message $message -logFilePath $logFilePath

    if (Test-Path $agentPath) {
        try {
            Start-Process $agentPath -ArgumentList "/silent /install" -Wait
            Log-Message -message "Agent installation completed for $client $site" -logFilePath $logFilePath
        } catch {
            Log-Message -message "Error during Agent installation: $_" -logFilePath $logFilePath
        }
    } else {
        Log-Message -message "Agent executable not found at $agentPath." -logFilePath $logFilePath
    }
}
