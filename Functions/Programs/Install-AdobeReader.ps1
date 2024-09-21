param (
    [string]$logFilePath
)

# Ensure $logFilePath is not empty
if ([string]::IsNullOrEmpty($logFilePath)) {
    throw "The log file path cannot be empty."
}

# Function to install Adobe Reader using winget
function Install-AdobeReader {
    Add-Content -Path $logFilePath -Value "Attempting to install Adobe Reader..."

    # Check if Adobe Reader is already installed
    $adobeInstalled = Get-Command "acrord32.exe" -ErrorAction SilentlyContinue
    if ($adobeInstalled) {
        Add-Content -Path $logFilePath -Value "Found an existing package already installed."
        Add-Content -Path $logFilePath -Value "Trying to upgrade the installed package..."
    }

    try {
        # Try to install Adobe Reader using winget
        winget install --id Adobe.Acrobat.Reader.64-bit --silent --accept-package-agreements --accept-source-agreements 2>&1
        $exitCode = $LASTEXITCODE

        if ($exitCode -eq 0) {
            Add-Content -Path $logFilePath -Value "Adobe Reader installed successfully."
        }
        else {
            $errorDetails = $errorDetails -replace "(?m)^\s*(\d+%.*|-.*|\\.*)?$", ""  # Remove percentage lines, lines with just a dash, lines with just a backslash, and empty lines
            Add-Content -Path $logFilePath -Value "Failed to install Adobe Reader. Exit code: $exitCode"
            Add-Content -Path $logFilePath -Value "Error details:"
            Add-Content -Path $logFilePath -Value $errorDetails
        }
    }
    catch {
        Add-Content -Path $logFilePath -Value "An error occurred during Adobe Reader installation: $_ "
    }
}

# Call the function to install Adobe Reader
Install-AdobeReader
