function New-AuthorizationHeaderBearerToken {
    [CmdletBinding()]
    [OutputType()]
    param (
        [Parameter(Mandatory = $true, Position = 1)]
        [Alias('URI')]
        [string] $URL,

        [Parameter(Mandatory = $true, Position = 2)]
        [string] $BearerToken
    )

    if(-not ($BearerToken.StartsWith("Bearer ")))
    {
        $BearerToken = "Bearer $BearerToken"
    }

    @{
        "Authorization" = "$BearerToken"
        "Host" = ([uri]$URL).Host
    }
}