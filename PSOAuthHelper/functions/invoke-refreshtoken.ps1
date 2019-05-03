
<#
    .SYNOPSIS
        Invoke a refresh token authorization flow
        
    .DESCRIPTION
        Invoke an OAuth 2.0 Refresh Token Grant flow against the authorization server
        
    .PARAMETER AuthProviderUri
        The URL / URI for the authorization server
        
    .PARAMETER ClientId
        The Client Id that you want to use for the authentication process
        
    .PARAMETER RefreshToken
        The Refresh Token that you want to use for the authentication process
        
    .EXAMPLE
        PS C:\> Invoke-RefreshToken -AuthProviderUri "https://login.microsoftonline.com/common/oauth2/token" -ClientId "dea8d7a9-1602-4429-b138-111111111111" -RefreshToken "Tsdljfasfe2j32324"
        
        This will invoke an Refresh Token Grant flow against Azure Active Directory for the common endpoint.
        The ClientId is "dea8d7a9-1602-4429-b138-111111111111".
        The RefreshToken is "Tsdljfasfe2j32324".
        
    .LINK
        Invoke-PasswordGrant
        
    .NOTES
        
        Tags: Refresh, Token, ClientId
        
        Author: Mötz Jensen (@Splaxi)
        
#>

function Invoke-RefreshToken {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSAvoidUsingPlainTextForPassword", "")]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSAvoidUsingUserNameAndPassWordParams", "")]
    [CmdletBinding()]
    [OutputType()]
    param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = "Simple", Position = 1)]
        [Parameter(Mandatory = $true, ParameterSetName = "Object", Position = 1)]
        [string] $AuthProviderUri,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = "Simple", Position = 2)]
        [Parameter(Mandatory = $true, ParameterSetName = "Object", Position = 2)]
        [string] $ClientId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = "Simple", Position = 3)]
        [Alias('refresh_token')]
        [Alias('Token')]
        [string] $RefreshToken,

        [Parameter(Mandatory = $false, ParameterSetName = "Object", Position = 3)]
        [PSCustomObject] $InputObject
    )

    if ($PsCmdlet.ParameterSetName -eq "Simple") {
        Invoke-Authorization @PSBoundParameters -GrantType "refresh_token"
    }
    else {
        Invoke-Authorization -AuthProviderUri $AuthProviderUri -ClientId $ClientId -GrantType "refresh_token" -RefreshToken $InputObject.refresh_token
    }
}