param (
    [string]$logFilePath
)

# Ensure $logFilePath is not empty
if ([string]::IsNullOrEmpty($logFilePath)) {
    throw "The log file path cannot be empty."
}

# Function to install Google Chrome using winget
function Install-Chrome {
    Add-Content -Path $logFilePath -Value "Attempting to install Google Chrome..."

    # Check if Chrome is already installed
    $chromeInstalled = Get-Command "chrome.exe" -ErrorAction SilentlyContinue
    if ($chromeInstalled) {
        Add-Content -Path $logFilePath -Value "Found an existing package already installed."
        Add-Content -Path $logFilePath -Value "Trying to upgrade the installed package..."
    }

    try {
        # Try to install Chrome using winget
        winget install --id Google.Chrome --silent --accept-package-agreements --accept-source-agreements 2>&1
        $exitCode = $LASTEXITCODE

        if ($exitCode -eq 0) {
            Add-Content -Path $logFilePath -Value "`Google Chrome installed successfully."
        } else {
            $errorDetails = $errorDetails -replace "(?m)^\s*(\d+%.*|-.*|\\.*)?$�", ""  # Remove percentage lines, lines with just a dash, lines with just a backslash, and empty lines
            Add-Content -Path $logFilePath -Value "Failed to install Google Chrome. Exit code: $exitCode"
            Add-Content -Path $logFilePath -Value "Error details:"
            Add-Content -Path $logFilePath -Value $errorDetails
        }
    } catch {
        Add-Content -Path $logFilePath -Value "An error occurred during Google Chrome installation: $_ "
    }
}

# Call the function to install Google Chrome
Install-Chrome
