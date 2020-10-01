---
external help file: PSOAuthHelper-help.xml
Module Name: PSOAuthHelper
online version:
schema: 2.0.0
---

# Invoke-AzureResourceManagementGrant

## SYNOPSIS
Invoke a password authorization flow specialized for the Azure Resource Management REST API

## SYNTAX

```
Invoke-AzureResourceManagementGrant [-TenantName] <String> [[-Username] <String>] [[-Password] <String>]
 [-EnableException] [<CommonParameters>]
```

## DESCRIPTION
Invoke an OAuth 2.0 Password Grant flow that is specialized for the Azure Resource Management REST API

## EXAMPLES

### EXAMPLE 1
```
Invoke-AzureResourceManagementGrant -TenantName "Contoso.onmicrosoft.com"
```

This will authenticate against the "Contoso.onmicrosoft.com" tenant and get a valid OAuth token.
It will prompt you for username and password which it will use for the authentication request.

### EXAMPLE 2
```
Invoke-AzureResourceManagementGrant -TenantName "Contoso.onmicrosoft.com" -Username "Alice" -Password "Pass@word1"
```

This will authenticate against the "Contoso.onmicrosoft.com" tenant and get a valid OAuth token.
It will use the provided username and password for the authentication request.

### EXAMPLE 3
```
Invoke-AzureResourceManagementGrant -TenantName "Contoso.onmicrosoft.com" -Username "Alice" -Password "Pass@word1" | Get-BearerToken
```

This will provide you with a well formatted BearerToken string.
This will authenticate against the "Contoso.onmicrosoft.com" tenant and get a valid OAuth token.
It will use the provided username and password for the authentication request.
It will pipe the output from Invoke-AzureResourceManagementGrant into the Get-BearerToken cmdlet.

## PARAMETERS

### -TenantName
Name of the Azure AD tenant that you want the authrization request to work against

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Username
Username for the user that you want to authenticate as

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Password
Password for the user that you want to authenticate as

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -EnableException
This parameters disables user-friendly warnings and enables the throwing of exceptions
This is less user friendly, but allows catching exceptions in calling scripts

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES
Tags: ARM, Azure Resource Management, REST API

Author: Mötz Jensen (@Splaxi)

## RELATED LINKS
