
<#
    .SYNOPSIS
        Short description
        
    .DESCRIPTION
        Long description
        
    .PARAMETER AuthProviderUri
        Parameter description
        
    .PARAMETER Resource
        Parameter description
        
    .PARAMETER GrantType
        Parameter description
        
    .PARAMETER ClientId
        Parameter description
        
    .PARAMETER ClientSecret
        Parameter description
        
    .PARAMETER Scope
        Parameter description
        
    .EXAMPLE
        An example
        
    .NOTES
        General notes
#>

function Get-BearerToken {
    [CmdletBinding()]
    [OutputType()]
    param (
        [Parameter(Mandatory = $True, Position = 1)]
        [string] $AuthProviderUri,

        [Parameter(Mandatory = $true, Position = 2)]
        [string] $Resource,

        [Parameter(Mandatory = $true, Position = 3)]
        [string] $GrantType,

        [Parameter(Mandatory = $false, Position = 4)]
        [string] $ClientId,

        [Parameter(Mandatory = $false, Position = 5)]
        [string] $ClientSecret,

        [Parameter(Mandatory = $false, Position = 8)]
        [string] $Scope
    )

    $requestToken = Invoke-ClientCredentialsGrant @PSBoundParameters
    
    "Bearer $($requestToken.access_token)"
}