<#
.SYNOPSIS
Short description

.DESCRIPTION
Long description

.PARAMETER InputObject
Parameter description

.PARAMETER KeyPrefix
Parameter description

.PARAMETER ValuePrefix
Parameter description

.PARAMETER KeepCase
Parameter description

.EXAMPLE
An example

.NOTES
General notes
#>

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