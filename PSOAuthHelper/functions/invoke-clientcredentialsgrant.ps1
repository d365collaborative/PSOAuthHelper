
<#
    .SYNOPSIS
        Invoke a Client Credentials authorization flow
        
    .DESCRIPTION
        Invoke an OAuth 2.0 Client Credentials Grant flow against the authorization server
        
    .PARAMETER AuthProviderUri
        The URL / URI for the authorization server
        
    .PARAMETER Resource
        The URL / URI for the protected resource you want the token to be valid to
        
    .PARAMETER ClientId
        The Client Id that you want to use for the authentication process
        
    .PARAMETER ClientSecret
        The Client Secret that you want to use for the authentication process
        
    .PARAMETER TenantId
        The tenant id for the organization that you want to work agains
        
        It can be the full guid id OR it can be the current primary domain name
        
    .PARAMETER Scope
        The scope details that you want the token to valid for
        
    .PARAMETER AuthEndpointV1
        Instruct the cmdlet to work agains the v1 endpoint in Azure AD
        
    .PARAMETER AuthEndpointV2
        Instruct the cmdlet to work agains the v2 endpoint in Azure AD
        
    .PARAMETER EnableException
        This parameters disables user-friendly warnings and enables the throwing of exceptions
        This is less user friendly, but allows catching exceptions in calling scripts
        
    .EXAMPLE
        PS C:\> Invoke-ClientCredentialsGrant -AuthProviderUri "https://login.microsoftonline.com/e674da86-7ee5-40a7-b777-1111111111111/oauth2/token" -Resource "https://www.superfantasticservername.com" -ClientId "dea8d7a9-1602-4429-b138-111111111111" -ClientSecret "Vja/VmdxaLOPR+alkjfsadffelkjlfw234522="
        
        This will invoke an OAuth Client Credentials Grant flow against Azure Active Directory for the tenant id "e674da86-7ee5-40a7-b777-1111111111111".
        The token will be valid for the "https://www.superfantasticservername.com" resource.
        The ClientId is "dea8d7a9-1602-4429-b138-111111111111".
        The ClientSecret is "Vja/VmdxaLOPR+alkjfsadffelkjlfw234522="
        
    .NOTES
        Author: Mötz Jensen (@Splaxi)
        
#>

function Invoke-ClientCredentialsGrant {
    [CmdletBinding(DefaultParameterSetName = "Default")]
    [OutputType()]
    param (
        [Parameter(ParameterSetName = "Default", Mandatory = $true)]
        [string] $AuthProviderUri,

        [Parameter(ParameterSetName = "Default", Mandatory = $true)]
        [Parameter(ParameterSetName = "v1", Mandatory = $true)]
        [Parameter(ParameterSetName = "v2", Mandatory = $false)]
        [Alias('Url')]
        [Alias('Uri')]
        [string] $Resource,

        [Parameter(Mandatory = $true)]
        [string] $ClientId,

        [Parameter(Mandatory = $true)]
        [string] $ClientSecret,

        [Parameter(ParameterSetName = "v1", Mandatory = $true)]
        [Parameter(ParameterSetName = "v2", Mandatory = $true)]
        [Alias('Tenant')]
        [string] $TenantId,

        [Parameter(ParameterSetName = "Default", Mandatory = $false)]
        [Parameter(ParameterSetName = "v1", Mandatory = $false)]
        [Parameter(ParameterSetName = "v2", Mandatory = $true)]
        [string] $Scope,

        [Parameter(ParameterSetName = "v1", Mandatory = $true)]
        [switch] $AuthEndpointV1,

        [Parameter(ParameterSetName = "v2", Mandatory = $true)]
        [switch] $AuthEndpointV2,

        [switch] $EnableException
    )

    $parms = Get-DeepClone -InputObject $PSBoundParameters
    $parms.Remove("AuthEndpointV1") > $null
    $parms.Remove("AuthEndpointV2") > $null
    $parms.Remove("TenantId") > $null

    if (-not $AuthProviderUri) {
        $AuthProviderUri = if ($AuthEndpointV1) { "https://login.microsoftonline.com/{0}/oauth2/token" -f $TenantId } else { "https://login.microsoftonline.com/{0}/oauth2/v2.0/token" -f $TenantId }
    }

    $parms.AuthProviderUri = $AuthProviderUri
    
    Invoke-Authorization @parms -GrantType "client_credentials"
}