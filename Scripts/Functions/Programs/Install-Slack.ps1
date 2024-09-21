param (
    [string]$logFilePath
)

# Ensure $logFilePath is not empty
if ([string]::IsNullOrEmpty($logFilePath)) {
    throw "The log file path cannot be empty."
}

# Function to install Slack using winget
function Install-Slack {
    Add-Content -Path $logFilePath -Value "Attempting to install Slack..."

    # Check if Slack is already installed
    $SlackInstalled = Get-Command "winword.exe" -ErrorAction SilentlyContinue
    if ($SlackInstalled) {
        Add-Content -Path $logFilePath -Value "Found an existing package already installed."
        Add-Content -Path $logFilePath -Value "Trying to upgrade the installed package..."
    }

    try {
        # Try to install Slack using winget
        winget install --id SlackTechnologies.Slack --scope machine --silent --accept-package-agreements --accept-source-agreements 2>&1
        $exitCode = $LASTEXITCODE

        if ($exitCode -eq 0) {
            Add-Content -Path $logFilePath -Value "Slack installed successfully."
        } else {
            $errorDetails = $errorDetails -replace "(?m)^\s*(\d+%.*|-.*|\\.*)?$", ""  # Remove percentage lines, lines with just a dash, lines with just a backslash, and empty lines
            Add-Content -Path $logFilePath -Value "Failed to install Slack. Exit code: $exitCode"
            Add-Content -Path $logFilePath -Value "Error details:"
            Add-Content -Path $logFilePath -Value $errorDetails
        }
    } catch {
        Add-Content -Path $logFilePath -Value "An error occurred during Slack installation: $_ "
    }
}

# Call the function to install Slack
Install-Slack
