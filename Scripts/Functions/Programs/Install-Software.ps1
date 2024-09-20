function Install-Software {
    param (
        [string]$client,
        [string]$site,
        [string]$logFilePath
    )

    $siteInfo = $clientSiteList[$client][$site]

    if ($siteInfo.InstallChrome) {
        $message = "`nInstalling Chrome for $GetPCName"
        Write-Output $message
        Log-Message -message $message -logFilePath $logFilePath
        # Call the Chrome installation script
        $chromeInstallScriptPath = "$PSScriptRoot\Functions\install_chrome.ps1"
        if (Test-Path $chromeInstallScriptPath) {
            try {
                . $chromeInstallScriptPath -logFilePath $logFilePath
            }
            catch {
                Log-Message -message "Error during Chrome installation: $_" -logFilePath $logFilePath
            }
        }
        else {
            Log-Message -message "Chrome installation script not found." -logFilePath $logFilePath
        }
    }

    if ($siteInfo.InstallAdobeReader) {
        $message = "`nInstalling Adobe Reader for $GetPCName"
        Write-Output $message
        Log-Message -message $message -logFilePath $logFilePath
        # Call the Adobe Reader installation script
        $adobeInstallScriptPath = "$PSScriptRoot\Functions\install_adobe_reader.ps1"
        if (Test-Path $adobeInstallScriptPath) {
            try {
                . $adobeInstallScriptPath -logFilePath $logFilePath
            }
            catch {
                Log-Message -message "Error during Adobe Reader installation: $_" -logFilePath $logFilePath
            }
        }
        else {
            Log-Message -message "Adobe Reader installation script not found." -logFilePath $logFilePath
        }
    }

    if ($siteInfo.InstallOffice) {
        $message = "`nInstalling Office for $GetPCName"
        Write-Output $message
        Log-Message -message $message -logFilePath $logFilePath
        # Call the Office 365 installation script
        $officeInstallScriptPath = "$PSScriptRoot\Functions\install_office365.ps1"
        if (Test-Path $officeInstallScriptPath) {
            try {
                . $officeInstallScriptPath -logFilePath $logFilePath
            }
            catch {
                Log-Message -message "Error during Office installation: $_" -logFilePath $logFilePath
            }
        }
        else {
            Log-Message -message "Office installation script not found." -logFilePath $logFilePath
        }
    }

    if ($siteInfo.InstallSupportAgent) {
        $message = "`nInstalling Support Assistant for $GetPCName"
        Write-Output $message
        Log-Message -message $message -logFilePath $logFilePath
        # Call the support agent installation script
        $supportAgentInstallScriptPath = "$PSScriptRoot\Functions\install_support_agent.ps1"
        if (Test-Path $supportAgentInstallScriptPath) {
            try {
                . $supportAgentInstallScriptPath -logFilePath $logFilePath
            }
            catch {
                Log-Message -message "Error during support agent installation: $_" -logFilePath $logFilePath
            }
        }
        else {
            Log-Message -message "Support agent installation script not found." -logFilePath $logFilePath
        }
    }

    # Install the agent
    $message = "Installing Agent for $client $site"
    Write-Output $message
    Log-Message -message $message -logFilePath $logFilePath
    Start-Process $siteInfo.Agent -ArgumentList "/silent /install"
}
