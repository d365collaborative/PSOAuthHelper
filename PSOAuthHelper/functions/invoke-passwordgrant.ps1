
<#
    .SYNOPSIS
        Invoke a password authorization flow
        
    .DESCRIPTION
        Invoke an OAuth 2.0 Password Grant flow against the authorization server
        
    .PARAMETER AuthProviderUri
        The URL / URI for the authorization server
        
    .PARAMETER Resource
        The URL / URI for the protected resource you want the token to be valid to
        
    .PARAMETER ClientId
        The Client Id that you want to use for the authentication process
        
    .PARAMETER Username
        Username for the user that you want to authenticate as
        
    .PARAMETER Password
        Password for the user that you want to authenticate as

    .PARAMETER Scope
        The scope details that you want the token to valid for
        
    .EXAMPLE
        PS C:\> Invoke-PasswordGrant -AuthProviderUri "https://login.microsoftonline.com/common/oauth2/token" -Resource "https://www.superfantasticservername.com" -ClientId "dea8d7a9-1602-4429-b138-111111111111" -Username "serviceaccount@domain.com" -Password "TopSecretPassword" -Scope "openid"
        
        This will invoke an OAuth Password Grant flow against Azure Active Directory for the common endpoint.
        The token will be valid for the "https://www.superfantasticservername.com" resource.
        The ClientId is "dea8d7a9-1602-4429-b138-111111111111".
        The Username is "serviceaccount@domain.com".
        The Password is "TopSecretPassword".
        The Scope is "openid".
        
    .NOTES
        Author: Mötz Jensen (@Splaxi)
        
#>

function Invoke-PasswordGrant {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSAvoidUsingPlainTextForPassword", "")]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSAvoidUsingUserNameAndPassWordParams", "")]
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
        [string] $Username,

        [Parameter(Mandatory = $false, Position = 6)]
        [string] $Password,

        [Parameter(Mandatory = $false, Position = 8)]
        [string] $Scope
    )

    Invoke-Authorization @PSBoundParameters -GrantType "password"
}