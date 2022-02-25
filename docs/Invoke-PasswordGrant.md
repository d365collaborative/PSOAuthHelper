﻿---
external help file: PSOAuthHelper-help.xml
Module Name: PSOAuthHelper
online version:
schema: 2.0.0
---

# Invoke-PasswordGrant

## SYNOPSIS
Invoke a password authorization flow

## SYNTAX

### Default (Default)
```
Invoke-PasswordGrant -AuthProviderUri <String> -Resource <String> -ClientId <String> -Username <String>
 -Password <String> [-Scope <String>] [-EnableException] [<CommonParameters>]
```

### v2
```
Invoke-PasswordGrant [-Resource <String>] -ClientId <String> -Username <String> -Password <String>
 -TenantId <String> -Scope <String> [-AuthEndpointV2] [-EnableException] [<CommonParameters>]
```

### v1
```
Invoke-PasswordGrant -Resource <String> -ClientId <String> -Username <String> -Password <String>
 -TenantId <String> [-Scope <String>] [-AuthEndpointV1] [-EnableException] [<CommonParameters>]
```

## DESCRIPTION
Invoke an OAuth 2.0 Password Grant flow against the authorization server

## EXAMPLES

### EXAMPLE 1
```
Invoke-PasswordGrant -AuthProviderUri "https://login.microsoftonline.com/common/oauth2/token" -Resource "https://www.superfantasticservername.com" -ClientId "dea8d7a9-1602-4429-b138-111111111111" -Username "serviceaccount@domain.com" -Password "TopSecretPassword" -Scope "openid"
```

This will invoke an OAuth Password Grant flow against Azure Active Directory for the common endpoint.
The token will be valid for the "https://www.superfantasticservername.com" resource.
The ClientId is "dea8d7a9-1602-4429-b138-111111111111".
The Username is "serviceaccount@domain.com".
The Password is "TopSecretPassword".
The Scope is "openid".

## PARAMETERS

### -AuthProviderUri
The URL / URI for the authorization server

```yaml
Type: String
Parameter Sets: Default
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Resource
The URL / URI for the protected resource you want the token to be valid to

```yaml
Type: String
Parameter Sets: Default, v1
Aliases: Uri, Url

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

```yaml
Type: String
Parameter Sets: v2
Aliases: Uri, Url

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ClientId
The Client Id that you want to use for the authentication process

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
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

Required: True
Position: Named
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

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -TenantId
The tenant id for the organization that you want to work agains

It can be the full guid id OR it can be the current primary domain name

```yaml
Type: String
Parameter Sets: v2, v1
Aliases: Tenant

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Scope
The scope details that you want the token to valid for

```yaml
Type: String
Parameter Sets: Default, v1
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

```yaml
Type: String
Parameter Sets: v2
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -AuthEndpointV1
Instruct the cmdlet to work agains the v1 endpoint in Azure AD

```yaml
Type: SwitchParameter
Parameter Sets: v1
Aliases:

Required: True
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -AuthEndpointV2
Instruct the cmdlet to work agains the v2 endpoint in Azure AD

```yaml
Type: SwitchParameter
Parameter Sets: v2
Aliases:

Required: True
Position: Named
Default value: False
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
Author: Mötz Jensen (@Splaxi)

## RELATED LINKS
