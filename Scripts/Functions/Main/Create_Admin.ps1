# Define the log file path
$logFile = ".\Functions\Main\Create_Admin.log"

# Function to log messages
function Log-Message {
    param (
        [string]$message
    )
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    Add-Content -Path $logFile -Value "$timestamp - $message"
}

# Log the start of the script
Log-Message "Script started."

# Define user details
$username = "adm.xuli"
$displayName = "ILUX Administration"
$password = "T3MPN0W#"

# Create the user
Log-Message "Creating user $username."
New-LocalUser -Name $username -Password (ConvertTo-SecureString $password -AsPlainText -Force) -FullName $displayName -PasswordNeverExpires $true
Log-Message "User $username created."

# Add the user to the Administrators group
Log-Message "Adding user $username to Administrators group."
Add-LocalGroupMember -Group "Administrators" -Member $username
Log-Message "User $username added to Administrators group."

# Log the end of the script
Log-Message "Script completed."
