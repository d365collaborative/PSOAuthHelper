
<#
    .SYNOPSIS
        Get an authorization header
        
    .DESCRIPTION
        Get a valid HTTP header with the needed authorization details filled out for a bearer token
        
    .PARAMETER URL
        URI / URL for the endpoint that you want the header to be valid for
        
    .PARAMETER BearerToken
        The token value received from your earlier OAuth 2.0 flow
        
    .EXAMPLE
        PS C:\> New-AuthorizationHeaderBearerToken -URL "https://www.superfantasticservername.com" -BearerToken "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOi....."
        
        This will return a hashtable with the Authorization and Host elements filled out.
        
    .NOTES
        Tags: Header, Token, Bearer, Authorization
        
        Author: Mötz Jensen (@Splaxi)
        
#>

function New-AuthorizationHeaderBearerToken {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSUseShouldProcessForStateChangingFunctions", "")]
    [CmdletBinding()]
    [OutputType('System.Collections.Hashtable')]
    param (
        [Parameter(Mandatory = $true, Position = 1)]
        [Alias('URI')]
        [string] $URL,

        [Parameter(Mandatory = $true, Position = 2)]
        [string] $BearerToken
    )

    if (-not ($BearerToken.StartsWith("Bearer "))) {
        $BearerToken = "Bearer $BearerToken"
    }

    @{
        "Authorization" = "$BearerToken"
        "Host"          = ([uri]$URL).Host
    }
}