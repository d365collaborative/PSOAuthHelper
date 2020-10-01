
<#
    .SYNOPSIS
        Get a bearer token string
        
    .DESCRIPTION
        Easy way to create a bearer token string from a object
        
    .PARAMETER InputObject
        The object you received from any of the Invoke-* commands that returns an access token
        
    .PARAMETER Raw
        Instruct the cmdlets to return just the token value as a raw string
        
    .EXAMPLE
        PS C:\> Invoke-ClientCredentialsGrant -AuthProviderUri "https://login.microsoftonline.com/e674da86-7ee5-40a7-b777-1111111111111/oauth2/token" -Resource "https://www.superfantasticservername.com" -ClientId "dea8d7a9-1602-4429-b138-111111111111" -ClientSecret "Vja/VmdxaLOPR+alkjfsadffelkjlfw234522=" | Get-BearerToken
        
        This will run the Invoke-ClientCredentialsGrant cmdlet with all the needed parameters.
        Then it will pass the output to the Get-BearerToken through the pipeline.
        
    .LINK
        Invoke-ClientCredentialsGrant
        
    .LINK
        Invoke-PasswordGrant
        
    .LINK
        Invoke-RefreshToken
        
    .NOTES
        Tags: BearerToken, Token, AccessToken, Bearer
        
        Author: Mötz Jensen (@Splaxi)
#>

function Get-BearerToken {
    [CmdletBinding()]
    [OutputType('System.String')]
    param (
        [Parameter(Mandatory = $true, ValueFromPipeline = $true, Position = 1)]
        [PSCustomObject] $InputObject,

        [switch] $Raw
    )

    process {
        if ($Raw) {
            $($InputObject.access_token)
        }
        else {
            "Bearer $($InputObject.access_token)"
        }
    }
}