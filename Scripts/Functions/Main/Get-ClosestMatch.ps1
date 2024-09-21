function Get-ClosestMatch {
    param (
        [string]$name,
        [hashtable]$mapping
    )
    foreach ($key in $mapping.Keys) {
        if ($name -like "$key*") {
            return $key
        }
    }
    return $null
}
