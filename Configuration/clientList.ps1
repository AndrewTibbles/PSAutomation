# Define a nested hashtable to store client site agents and installation flags
$clientSiteList = @{
    "Client1" = @{
        "Site1" = @{
            "Agent" = "$PSScriptRoot\Agents\Client1\Site1\Agent.exe"
            "InstallChrome" = $true
            "InstallAdobeReader" = $true
            "InstallOffice" = $true
            "InstallSupportAgent" = $true
        }
        "Site2" = @{
            "Agent" = "$PSScriptRoot\Agents\Client1\Site2\Agent.exe"
            "InstallChrome" = $true
            "InstallAdobeReader" = $false
            "InstallOffice" = $false
            "InstallSupportAgent" = $true
        }
    }
    "Client2" = @{
        "Site1" = @{
            "Agent" = "$PSScriptRoot\Agents\Client2\Site1\Agent.exe"
            "InstallChrome" = $true
            "InstallAdobeReader" = $true
            "InstallOffice" = $true
            "InstallSupportAgent" = $true
        }
        "Site2" = @{
            "Agent" = "$PSScriptRoot\Agents\Client2\Site2\Agent.exe"
            "InstallChrome" = $true
            "InstallAdobeReader" = $false
            "InstallOffice" = $false
            "InstallSupportAgent" = $true
        }
    }
    "ILUX" = @{
        "Cambridge" = @{
            "Agent" = "$PSScriptRoot\Agents\ILUX\Cambridge\Agent.exe"
            "InstallChrome" = $true
            "InstallAdobeReader" = $true
            "InstallOffice" = $true
            "InstallSupportAgent" = $true
        }
    }
}
