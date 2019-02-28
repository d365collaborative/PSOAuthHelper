function Invoke-ClientCredentialsGrant {
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

    Invoke-Authorization @PSBoundParameters
}