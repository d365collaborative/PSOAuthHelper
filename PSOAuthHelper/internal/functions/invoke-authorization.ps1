
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
        [Parameter(Mandatory = $true, Position = 1)]
        [string] $AuthProviderUri,

        [Parameter(Mandatory = $true, Position = 2)]
        [string] $Resource,

        [Parameter(Mandatory = $true, Position = 3)]
        [string] $GrantType,

        [Parameter(Mandatory = $false, Position = 4)]
        [string] $ClientId,

        [Parameter(Mandatory = $false, Position = 5)]
        [string] $ClientSecret,

        [Parameter(Mandatory = $false, Position = 6)]
        [string] $Username,

        [Parameter(Mandatory = $false, Position = 7)]
        [string] $Password,

        [Parameter(Mandatory = $false, Position = 8)]
        [string] $Scope
    )


    $parms = @{}
    $parms.resource = [System.Web.HttpUtility]::UrlEncode($Resource)
    $parms.grant_type = [System.Web.HttpUtility]::UrlEncode($GrantType)
    
    if (-not ($ClientId -eq "")) {$parms.client_id = [System.Web.HttpUtility]::UrlEncode($ClientId)}

    if (-not ($ClientSecret -eq "")) {$parms.client_secret = [System.Web.HttpUtility]::UrlEncode($ClientSecret)}

    if (-not ($Username -eq "")) {$parms.username = [System.Web.HttpUtility]::UrlEncode($Username)}

    if (-not ($Password -eq "")) {$parms.password = [System.Web.HttpUtility]::UrlEncode($Password)}

    if (-not ($Scope -eq "")) {$parms.scope = [System.Web.HttpUtility]::UrlEncode($Scope)}

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