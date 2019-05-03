
<#
    .SYNOPSIS
        Get how many minutes there is left of on token
        
    .DESCRIPTION
        Pass the token object directly into the cmdlet and see how many minutes are left before the token expires
        
    .PARAMETER InputObject
        The object you received from any of the Invoke-* commands that returns an access token
        
    .EXAMPLE
        PS C:\> Get-RemainingMinutes -InputObject $TokenObject
        
        This will analyse the expires_on and compare it with NOW, to see how many minutes there is left before the token will be expired.
        
    .LINK
        Invoke-ClientCredentialsGrant
        
    .LINK
        Invoke-PasswordGrant
        
    .LINK
        Invoke-RefreshToken
        
    .NOTES
        Tags: Token, Expiration, Expire
        
        Author: Mötz Jensen (@Splaxi)
#>

function Get-RemainingMinutes {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSUseSingularNouns", "")]
    [CmdletBinding()]
    [OutputType('System.Int32')]
    param (
        [Parameter(Mandatory = $true, Position = 1)]
        [PSCustomObject] $InputObject
    )

    [long]$nowSeconds = [long]([DatetimeOffset]::Now).ToUnixTimeSeconds()
    [long]$expiresOn = [long]$InputObject.expires_on

    [int](($expiresOn - $nowSeconds) / 60)
}