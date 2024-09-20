# Get the current PC name with validation
try {
    $pcName = $env:COMPUTERNAME
    if (-not $pcName) {
        throw "PC name is empty"
    }
    Log-Message "Current PC name: $pcName"
    return $pcName
} catch {
    Log-Message "Failed to get PC name: $_"
    throw "Failed to get PC name"
}
