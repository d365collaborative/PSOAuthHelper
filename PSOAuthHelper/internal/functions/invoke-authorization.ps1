
<#
    .SYNOPSIS
        Invoke an OAuth 2.0 authorization request
        
    .DESCRIPTION
        Invoke an OAuth 2.0 grant type flow request
        
    .PARAMETER AuthProviderUri
        The URL / URI for the authorization server
        
    .PARAMETER Resource
        The URL / URI for the protected resource you want the token to be valid to
        
    .PARAMETER GrantType
        The OAuth flow you want to utilize
        
        Valid Options:
        Authorization Code
        Implicit
        Password
        Client Credentials
        Device Code
        Refresh Token
        
    .PARAMETER ClientId
        The Client Id that you want to use for the authentication process
        
    .PARAMETER ClientSecret
        The Client Secret that you want to use for the authentication process
        
    .PARAMETER Username
        Username for the user that you want to authenticate as
        
    .PARAMETER Password
        Password for the user that you want to authenticate as
        
    .PARAMETER Scope
        The scope details that you want the token to valid for
        
    .PARAMETER RefreshToken
        The Refresh Token that you want to use for the authentication process
        
    .PARAMETER EnableException
        This parameters disables user-friendly warnings and enables the throwing of exceptions
        This is less user friendly, but allows catching exceptions in calling scripts

    .EXAMPLE
        PS C:\> Invoke-Authorization -AuthProviderUri "https://login.microsoftonline.com/e674da86-7ee5-40a7-b777-1111111111111/oauth2/token" -Resource "https://www.superfantasticservername.com" -GrantType "client_credentials" -ClientId "dea8d7a9-1602-4429-b138-111111111111" -ClientSecret "Vja/VmdxaLOPR+alkjfsadffelkjlfw234522="
        
        This will invoke an OAuth Client Credentials Grant flow against Azure Active Directory for the tenant id "e674da86-7ee5-40a7-b777-1111111111111".
        The token will be valid for the "https://www.superfantasticservername.com" resource.
        The ClientId is "dea8d7a9-1602-4429-b138-111111111111".
        The ClientSecret is "Vja/VmdxaLOPR+alkjfsadffelkjlfw234522="
        
    .NOTES
        Author: Mötz Jensen (@Splaxi)
        
#>

function Invoke-Authorization {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSAvoidUsingPlainTextForPassword", "")]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSAvoidUsingUserNameAndPassWordParams", "")]
    [CmdletBinding()]
    [OutputType('System.String')]
    param (
        [Parameter(Mandatory = $true)]
        [string] $AuthProviderUri,

        [string] $Resource,

        [string] $GrantType,

        [string] $ClientId,

        [string] $ClientSecret,

        [string] $Username,

        [string] $Password,

        [string] $Scope,

        [string] $RefreshToken,

        [switch] $EnableException
    )


    $parms = @{}
    $parms.resource = [System.Uri]::EscapeDataString($Resource)
    $parms.grant_type = [System.Uri]::EscapeDataString($GrantType)
    
    if (-not ($ClientId -eq "")) {$parms.client_id = [System.Uri]::EscapeDataString($ClientId)}

    if (-not ($ClientSecret -eq "")) {$parms.client_secret = [System.Uri]::EscapeDataString($ClientSecret)}

    if (-not ($Username -eq "")) {$parms.username = [System.Uri]::EscapeDataString($Username)}

    if (-not ($Password -eq "")) {$parms.password = [System.Uri]::EscapeDataString($Password)}

    if (-not ($Scope -eq "")) {$parms.scope = [System.Uri]::EscapeDataString($Scope)}

    if (-not ($RefreshToken -eq "")) {$parms.refresh_token = [System.Uri]::EscapeDataString($RefreshToken)}
    

    $body = (Convert-HashToArgStringSwitch -InputObject $parms -KeyPrefix "&" -ValuePrefix "=") -join ""

    $body = $body.Substring(1)

    Write-PSFMessage -Level Verbose -Message "Authenticating against Azure Active Directory (AAD)." -Target $body

    try {
        $requestParams = @{Method = "Post"; ContentType = "application/x-www-form-urlencoded";
                    Body = $body}

        $Authorization = Invoke-RestMethod $AuthProviderUri @requestParams
    }
    catch {
        Write-PSFMessage -Level Host -Message "Something went wrong while working against Azure Active Directory (AAD)" -Exception $PSItem.Exception -Target $body
        Stop-PSFFunction -Message "Stopping because of errors" -StepsUpward 1
        return
    }

    $Authorization
}