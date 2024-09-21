param (
    [string]$logFilePath
)

# Ensure $logFilePath is not empty
if ([string]::IsNullOrEmpty($logFilePath)) {
    throw "The log file path cannot be empty."
}

# Function to install Office 365 using winget
function Install-Office365 {
    Add-Content -Path $logFilePath -Value "Attempting to install Office 365..."

    # Check if Office 365 is already installed
    $officeInstalled = Get-Command "winword.exe" -ErrorAction SilentlyContinue
    if ($officeInstalled) {
        Add-Content -Path $logFilePath -Value "Found an existing package already installed."
        Add-Content -Path $logFilePath -Value "Trying to upgrade the installed package..."
    }

    try {
        # Try to install Office 365 using winget
        $installResult = winget install --id Microsoft.Office --silent --accept-package-agreements --accept-source-agreements 2>&1
        $exitCode = $LASTEXITCODE

        if ($exitCode -eq 0) {
            Add-Content -Path $logFilePath -Value "Office 365 installed successfully."
        } else {
            $errorDetails = $errorDetails -replace "(?m)^\s*(\d+%.*|-.*|\\.*)?$", ""  # Remove percentage lines, lines with just a dash, lines with just a backslash, and empty lines
            Add-Content -Path $logFilePath -Value "Failed to install Office 365. Exit code: $exitCode"
            Add-Content -Path $logFilePath -Value "Error details:"
            Add-Content -Path $logFilePath -Value $errorDetails
        }
    } catch {
        Add-Content -Path $logFilePath -Value "An error occurred during Office 365 installation: $_"
    }
}

# Call the function to install Office 365
Install-Office365
