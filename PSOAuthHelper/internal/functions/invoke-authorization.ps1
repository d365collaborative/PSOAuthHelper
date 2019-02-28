
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
        Parameter description
        
    .PARAMETER Password
        Parameter description
        
    .PARAMETER Scope
        Parameter description
        
    .EXAMPLE
        An example
        
    .NOTES
        General notes
#>

function Invoke-Authorization {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSAvoidUsingPlainTextForPassword", "")]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSAvoidUsingUserNameAndPassWordParams", "")]
    [CmdletBinding()]
    [OutputType('System.String')]
    param (
        [Parameter(Mandatory = $True, Position = 1)]
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