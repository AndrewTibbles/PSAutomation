param (
    [string]$logFilePath
)

# Ensure $logFilePath is not empty
if ([string]::IsNullOrEmpty($logFilePath)) {
    throw "The log file path cannot be empty."
}

# Function to check if a directory exists
function Is-DirectoryExists {
    param (
        [string]$directoryPath
    )
    return Test-Path -Path $directoryPath -PathType Container
}

# Function to install support agent based on OEM or CPU
function Install-SupportAgent {
    # Check the machine manufacturer
    Add-Content -Path $logFilePath -Value "`nGathering system information..."
    $OEM = Get-ItemPropertyValue HKLM:\HARDWARE\DESCRIPTION\System\BIOS -Name SystemManufacturer
    Add-Content -Path $logFilePath -Value "Machine manufacturer: $OEM"

    # Check the CPU manufacturer
    Add-Content -Path $logFilePath -Value "Checking CPU manufacturer..."
    $CPU = Get-WmiObject Win32_Processor | Select-Object -ExpandProperty Manufacturer
    Add-Content -Path $logFilePath -Value "CPU manufacturer: $CPU`n"

    switch ($OEM) {
        "Dell Inc." {
            # Install Dell Support Assistant
            if (-not (Is-DirectoryExists "C:\Program Files\Dell\SupportAssistAgent")) {
                Add-Content -Path $logFilePath -Value "Starting installation of Dell Support Assistant..."
                $Path = $env:TEMP
                $Installer = "SupportAssistInstaller.exe"
                $URL = "https://downloads.dell.com/serviceability/catalog/SupportAssistInstaller.exe"
                try {
                    Invoke-WebRequest $URL -OutFile "$Path\$Installer"
                    Add-Content -Path $logFilePath -Value "Downloaded Dell Support Assistant installer."
                    Start-Process -FilePath "$Path\$Installer" -Args "/silent /install" -Verb RunAs -Wait
                    Add-Content -Path $logFilePath -Value "Dell Support Assistant installation completed successfully."
                    Remove-Item "$Path\$Installer"
                }
                catch {
                    Add-Content -Path $logFilePath -Value "Failed to download or install Dell Support Assistant: $_"
                }
            }
            else {
                Add-Content -Path $logFilePath -Value "Dell Support Assistant is already installed."
            }
        }
        "HP" {
            # Install HP Support Assistant
            if (-not (Is-DirectoryExists "C:\Program Files (x86)\HP\HP Support Framework")) {
                Add-Content -Path $logFilePath -Value "Starting installation of HP Support Assistant..."
                $Path = $env:TEMP
                $Installer = "sp146042.exe"
                $URL = "https://ftp.hp.com/pub/softpaq/sp146001-146500/sp146042.exe"
                try {
                    Invoke-WebRequest $URL -OutFile "$Path\$Installer"
                    Add-Content -Path $logFilePath -Value "Downloaded HP Support Assistant installer."
                    Start-Process -FilePath "$Path\$Installer" -Verb RunAs -Wait
                    Add-Content -Path $logFilePath -Value "HP Support Assistant installation completed successfully."
                    Remove-Item "$Path\$Installer"
                }
                catch {
                    Add-Content -Path $logFilePath -Value "Failed to download or install HP Support Assistant: $_"
                }
            }
            else {
                Add-Content -Path $logFilePath -Value "HP Support Assistant is already installed."
            }
        }
        "Lenovo" {
            # Install Lenovo System Update
            if (-not (Is-DirectoryExists "C:\Program Files (x86)\Lenovo\System Update")) {
                Add-Content -Path $logFilePath -Value "`nStarting installation of Lenovo System Update..."
                $Path = $env:TEMP
                $Installer = "SystemUpdate.exe"
                $URL = "https://download.lenovo.com/pccbbs/thinkvantage_en/systemupdate5.07.0074.exe"
                try {
                    Invoke-WebRequest $URL -OutFile "$Path\$Installer"
                    Add-Content -Path $logFilePath -Value "Downloaded Lenovo System Update installer."
                    Start-Process -FilePath "$Path\$Installer" -Args "/S" -Verb RunAs -Wait
                    Add-Content -Path $logFilePath -Value "Lenovo System Update installation completed successfully."
                    Remove-Item "$Path\$Installer"
                }
                catch {
                    Add-Content -Path $logFilePath -Value "Failed to download or install Lenovo System Update: $_"
                }
            }
            else {
                Add-Content -Path $logFilePath -Value "Lenovo System Update is already installed."
            }
        }
        default {
            # Check if the CPU is Intel
            if ($CPU -eq "GenuineIntel") {
                # Install Intel Support Assistant
                if (-not (Is-DirectoryExists "C:\Program Files (x86)\Intel\Intel(R) Driver and Support Assistant")) {
                    Add-Content -Path $logFilePath -Value "`nStarting installation of Intel Support Assistant..."
                    $Path = $env:TEMP
                    $Installer = "IntelDriverSupportAssistantInstaller.exe"
                    $URL = "https://downloadmirror.intel.com/29909/a08/Intel-Driver-and-Support-Assistant-Installer.exe"
                    try {
                        Invoke-WebRequest $URL -OutFile "$Path\$Installer"
                        Add-Content -Path $logFilePath -Value "Downloaded Intel Support Assistant installer."
                        Start-Process -FilePath "$Path\$Installer" -Args "/silent /install" -Verb RunAs -Wait
                        Add-Content -Path $logFilePath -Value "Intel Support Assistant installation completed successfully."
                        Remove-Item "$Path\$Installer"
                    }
                    catch {
                        Add-Content -Path $logFilePath -Value "Failed to download or install Intel Support Assistant: $_"
                    }
                }
                else {
                    Add-Content -Path $logFilePath -Value "Intel Support Assistant is already installed."
                }
            }
            else {
                Add-Content -Path $logFilePath -Value "OEM is not supported at this time: $OEM"
            }
        }
    }
}

# Call the function to install Support Assistant
Install-SupportAgent
