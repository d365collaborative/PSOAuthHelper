function Convert-HashToArgStringSwitch {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSAvoidDefaultValueSwitchParameter", "")]
    [CmdletBinding()]
    [OutputType([System.String])]
    param (
        [HashTable] $InputObject,

        [string] $KeyPrefix = "-",

        [string] $ValuePrefix = ":",

        [switch] $KeepCase = $true
    )

    foreach ($key in $InputObject.Keys) {
        $value = "{0}" -f $InputObject.Item($key).ToString()
        if (-not $KeepCase) {$value = $value.ToLower()}
        "$KeyPrefix$($key)$ValuePrefix$($value)"
    }
}