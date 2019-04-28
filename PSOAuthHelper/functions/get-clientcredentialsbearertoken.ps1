
<#
    .SYNOPSIS
        Get a bearer token
        
    .DESCRIPTION
        Invoke an OAuth 2.0 Client Credentials Grant flow and extract the bearer token directly
        
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
        
    .PARAMETER Raw
        Instruct the cmdlets to return just the token value as a raw string

    .EXAMPLE
        PS C:\> Get-ClientCredentialsBearerToken -AuthProviderUri "https://login.microsoftonline.com/e674da86-7ee5-40a7-b777-1111111111111/oauth2/token" -Resource "https://www.superfantasticservername.com" -ClientId "dea8d7a9-1602-4429-b138-111111111111" -ClientSecret "Vja/VmdxaLOPR+alkjfsadffelkjlfw234522="
        
        This will invoke an OAuth Client Credentials Grant flow against Azure Active Directory for the tenant id "e674da86-7ee5-40a7-b777-1111111111111".
        The token will be valid for the "https://www.superfantasticservername.com" resource.
        The ClientId is "dea8d7a9-1602-4429-b138-111111111111".
        The ClientSecret is "Vja/VmdxaLOPR+alkjfsadffelkjlfw234522="

        It will return a string formated like:
        "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOi....."

    .EXAMPLE
        PS C:\> Get-ClientCredentialsBearerToken -AuthProviderUri "https://login.microsoftonline.com/e674da86-7ee5-40a7-b777-1111111111111/oauth2/token" -Resource "https://www.superfantasticservername.com" -ClientId "dea8d7a9-1602-4429-b138-111111111111" -ClientSecret "Vja/VmdxaLOPR+alkjfsadffelkjlfw234522="
        
        This will invoke an OAuth Client Credentials Grant flow against Azure Active Directory for the tenant id "e674da86-7ee5-40a7-b777-1111111111111".
        The token will be valid for the "https://www.superfantasticservername.com" resource.
        The ClientId is "dea8d7a9-1602-4429-b138-111111111111".
        The ClientSecret is "Vja/VmdxaLOPR+alkjfsadffelkjlfw234522="

        It will return a string formated like:
        "eyJ0eXAiOiJKV1QiLCJhbGciOi....."
        
    .NOTES
        Author: Mötz Jensen (@Splaxi)
#>

function Get-ClientCredentialsBearerToken {
    [CmdletBinding()]
    [OutputType('System.String')]
    param (
        [Parameter(Mandatory = $True, Position = 1)]
        [string] $AuthProviderUri,

        [Parameter(Mandatory = $true, Position = 2)]
        [string] $Resource,

        [Parameter(Mandatory = $false, Position = 4)]
        [string] $ClientId,

        [Parameter(Mandatory = $false, Position = 5)]
        [string] $ClientSecret,

        [Parameter(Mandatory = $false, Position = 8)]
        [string] $Scope,

        [switch] $Raw
    )

    $Params = Get-DeepClone $PSBoundParameters
    if($Params.ContainsKey("Raw")){$null = $Params.Remove("Raw")}

    $requestToken = Invoke-ClientCredentialsGrant @Params
 
    if($Raw) {
        $($requestToken.access_token)
    }else {
        "Bearer $($requestToken.access_token)"
    }
}