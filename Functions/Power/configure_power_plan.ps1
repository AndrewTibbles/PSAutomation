# Configures power options including sleep values, screen timeout values, CPU cooling policy, and disables Fastboot.
Write-Host "Preparing to configure power options."

# Set Sleep values
Write-Host "Setting Sleep values..."
powercfg -change -standby-timeout-ac 0
powercfg -change -standby-timeout-dc 30

# Set Screen Timeout values
Write-Host "Setting Screen Timeout values..."
powercfg -change -monitor-timeout-ac 15
powercfg -change -monitor-timeout-dc 15

# Set CPU Cooling Policy
Write-Host "Setting CPU Cooling Policy..."
powercfg /SETDCVALUEINDEX SCHEME_CURRENT 54533251-82be-4824-96c1-47b60b740d00 94d3a615-a899-4ac5-ae2b-e4d8f634367f 1
powercfg /SETACVALUEINDEX SCHEME_CURRENT 54533251-82be-4824-96c1-47b60b740d00 94d3a615-a899-4ac5-ae2b-e4d8f634367f 1

# Disable Fastboot
Write-Host "Disabling Fastboot..."
REG ADD "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Power" /V HiberbootEnabled /T REG_DWORD /D 0 /F

Write-Host "Process has been completed."
