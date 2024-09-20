param (
    [object]$pcNameMappingConfig
)

# Convert pcNameMapping to a Hashtable
$pcNameMapping = @{}
foreach ($key in $pcNameMappingConfig.PSObject.Properties.Name) {
    $pcNameMapping[$key] = $pcNameMappingConfig.$key
}

return $pcNameMapping
