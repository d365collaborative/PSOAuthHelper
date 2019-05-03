
<#
    .SYNOPSIS
        Get how many minutes there is left of on token
        
    .DESCRIPTION
        Pass the token object directly into the cmdlet and see how many minutes are left before the token expires
        
    .PARAMETER InputObject
        The token object received from you invoke-* cmdlets
        
    .EXAMPLE
        PS C:\> Get-RemainingMinutes -InputObject $TokenObject
        
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
    [CmdletBinding()]
    [OutputType()]
    param (
        [Parameter(Mandatory = $true, Position = 1)]
        [PSCustomObject] $InputObject
    )

    [long]$nowSeconds = [long]([DatetimeOffset]::Now).ToUnixTimeSeconds()
    [long]$expiresOn = [long]$InputObject.expires_on

    [int](($expiresOn - $nowSeconds) / 60)
}