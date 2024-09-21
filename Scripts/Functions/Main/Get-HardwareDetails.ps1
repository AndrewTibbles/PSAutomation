function Get-HardwareDetails {
    param (
        [string]$logFilePath
    )
    $cpu = Get-WmiObject Win32_Processor | Select-Object -ExpandProperty Name
    $ram = [math]::Round((Get-WmiObject Win32_ComputerSystem).TotalPhysicalMemory / 1GB, 2)
    $storage = Get-WmiObject Win32_LogicalDisk -Filter "DriveType=3" | Select-Object -ExpandProperty Size | ForEach-Object { [math]::Round($_ / 1GB, 2) } | Measure-Object -Sum | Select-Object -ExpandProperty Sum
    $os = (Get-WmiObject Win32_OperatingSystem).Caption
    $oem = Get-WmiObject Win32_ComputerSystem | Select-Object -ExpandProperty Manufacturer
    $oemModel = Get-WmiObject Win32_ComputerSystem | Select-Object -ExpandProperty Model

    $hardwareDetails = @"
CPU: $cpu
RAM: ${ram}GB
Storage: ${storage}GB
OS: $os
OEM: $oem
OEM Model: $oemModel
"@
    Write-Output $hardwareDetails
    Add-Content -Path $logFilePath -Value $hardwareDetails
}
