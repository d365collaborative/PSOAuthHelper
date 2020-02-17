
<#
    .SYNOPSIS
        Invoke a password authorization flow specialized for the Azure Resource Management REST API
        
    .DESCRIPTION
        Invoke an OAuth 2.0 Password Grant flow that is specialized for the Azure Resource Management REST API
        
    .PARAMETER TenantName
        Name of the Azure AD tenant that you want the authrization request to work against
        
    .PARAMETER Username
        Username for the user that you want to authenticate as
        
    .PARAMETER Password
        Password for the user that you want to authenticate as
        
    .EXAMPLE
        PS C:\> Invoke-AzureResourceManagementGrant -TenantName "Contoso.onmicrosoft.com"
        
        This will authenticate against the "Contoso.onmicrosoft.com" tenant and get a valid OAuth token.
        It will prompt you for username and password which it will use for the authentication request.
        
    .EXAMPLE
        PS C:\> Invoke-AzureResourceManagementGrant -TenantName "Contoso.onmicrosoft.com" -Username "Alice" -Password "Pass@word1"
        
        This will authenticate against the "Contoso.onmicrosoft.com" tenant and get a valid OAuth token.
        It will use the provided username and password for the authentication request.
        
    .EXAMPLE
        PS C:\> Invoke-AzureResourceManagementGrant -TenantName "Contoso.onmicrosoft.com" -Username "Alice" -Password "Pass@word1" | Get-BearerToken
        
        This will provide you with a well formatted BearerToken string.
        This will authenticate against the "Contoso.onmicrosoft.com" tenant and get a valid OAuth token.
        It will use the provided username and password for the authentication request.
        It will pipe the output from Invoke-AzureResourceManagementGrant into the Get-BearerToken cmdlet.
        
    .NOTES
        Tags: ARM, Azure Resource Management, REST API
        
        Author: Mötz Jensen (@Splaxi)
#>

function Invoke-AzureResourceManagementGrant {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSAvoidUsingPlainTextForPassword", "")]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSAvoidUsingUserNameAndPassWordParams", "")]
    [CmdletBinding()]
    [OutputType()]
    param (
        [Parameter(Mandatory = $true)]
        [string] $TenantName,

        [string] $Username,

        [string] $Password
    )

    # Username and Password
    if ([String]::IsNullOrEmpty($Username) -and [String]::IsNullOrEmpty($Password)) {
        $credentials = Get-Credential -Message "Enter your credentials."
    }
    else {
        $passwordSecured = ConvertTo-SecureString -String $Password -AsPlainText -Force
        $credentials = New-Object System.Management.Automation.PSCredential $Username, $passwordSecured
    }

    # Endpoint Uri used for authentication
    $authProviderUri = "https://login.microsoftonline.com/$TenantName/oauth2/token"

    $parms = @{ }
    $parms.AuthProviderUri = $authProviderUri
    $parms.Resource = "https://management.azure.com"
    $parms.ClientId = "1950a258-227b-4e31-a9cf-717495945fc2"
    $parms.GrantType = "password"
    $parms.Username = $credentials.GetNetworkCredential().username
    $parms.Password = $credentials.GetNetworkCredential().password
    $parms.Scope = "openid"

    Invoke-Authorization @parms
}