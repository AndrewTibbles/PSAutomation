# Get the parent directory of the script's location
$findparentFolder = Split-Path -Path $PSScriptRoot -Parent
$parentFolder = Split-Path -Path $findparentFolder -Parent

# Define a nested hashtable to store client site agents and installation flags
$clientSiteList = @{
    "Andrew" = @{
        "Cambridge" = @{
            "Agent" = "$parentFolder\Agents\Andrew\Cambridge\Agent.exe"
            "InstallChrome" = $true
            "InstallAdobeReader" = $true
            "InstallOffice" = $true
            "InstallSlack" = $true
            "InstallSupportAgent" = $true
        }
        "Site2" = @{
            "Agent" = "$parentFolder\Agents\Client1\Site2\Agent.exe"
            "InstallChrome" = $true
            "InstallAdobeReader" = $false
            "InstallOffice" = $false
            "InstallSlack" = $false
            "InstallSupportAgent" = $true
        }
    }
    "Client2" = @{
        "Site1" = @{
            "Agent" = "$parentFolder\Agents\Client2\Site1\Agent.exe"
            "InstallChrome" = $true
            "InstallAdobeReader" = $true
            "InstallOffice" = $true
            "InstallSlack" = $false
            "InstallSupportAgent" = $true
        }
        "Site2" = @{
            "Agent" = "$parentFolder\Agents\Client2\Site2\Agent.exe"
            "InstallChrome" = $true
            "InstallAdobeReader" = $false
            "InstallOffice" = $false
            "InstallSlack" = $false
            "InstallSupportAgent" = $true
        }
    }
    "ILUX" = @{
        "Cambridge" = @{
            "Agent" = "$parentFolder\Agents\ILUX\Cambridge\Agent.exe"
            "InstallChrome" = $true
            "InstallAdobeReader" = $true
            "InstallOffice" = $true
            "InstallSlack" = $false
            "InstallSupportAgent" = $true
        }
    }
}
