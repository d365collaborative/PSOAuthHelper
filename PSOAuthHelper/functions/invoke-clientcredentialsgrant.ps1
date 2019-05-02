
<#
    .SYNOPSIS
        Invoke a Client Credentials authorization flow
        
    .DESCRIPTION
        Invoke an OAuth 2.0 Client Credentials Grant flow against the authorization server
        
    .PARAMETER AuthProviderUri
        The URL / URI for the authorization server
        
    .PARAMETER Resource
        The URL / URI for the protected resource you want the token to be valid to
        
    .PARAMETER ClientId
        The Client Id that you want to use for the authentication process
        
    .PARAMETER ClientSecret
        The Client Secret that you want to use for the authentication process
        
    .PARAMETER Scope
        The scope details that you want the token to valid for
        
    .EXAMPLE
        PS C:\> Invoke-ClientCredentialsGrant -AuthProviderUri "https://login.microsoftonline.com/e674da86-7ee5-40a7-b777-1111111111111/oauth2/token" -Resource "https://www.superfantasticservername.com" -ClientId "dea8d7a9-1602-4429-b138-111111111111" -ClientSecret "Vja/VmdxaLOPR+alkjfsadffelkjlfw234522="
        
        This will invoke an OAuth Client Credentials Grant flow against Azure Active Directory for the tenant id "e674da86-7ee5-40a7-b777-1111111111111".
        The token will be valid for the "https://www.superfantasticservername.com" resource.
        The ClientId is "dea8d7a9-1602-4429-b138-111111111111".
        The ClientSecret is "Vja/VmdxaLOPR+alkjfsadffelkjlfw234522="
        
    .NOTES
        Author: Mötz Jensen (@Splaxi)
        
#>

function Invoke-ClientCredentialsGrant {
    [CmdletBinding()]
    [OutputType()]
    param (
        [Parameter(Mandatory = $True, Position = 1)]
        [string] $AuthProviderUri,

        [Parameter(Mandatory = $true, Position = 2)]
        [Alias('URL')]
        [Alias('URI')]
        [string] $Resource,

        [Parameter(Mandatory = $false, Position = 4)]
        [string] $ClientId,

        [Parameter(Mandatory = $false, Position = 5)]
        [string] $ClientSecret,

        [Parameter(Mandatory = $false, Position = 8)]
        [string] $Scope
    )

    Invoke-Authorization @PSBoundParameters -GrantType "client_credentials"
}