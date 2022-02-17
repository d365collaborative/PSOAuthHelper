---
external help file: PSOAuthHelper-help.xml
Module Name: PSOAuthHelper
online version:
schema: 2.0.0
---

# Invoke-ClientCredentialsGrant

## SYNOPSIS
Invoke a Client Credentials authorization flow

## SYNTAX

### Default (Default)
```
Invoke-ClientCredentialsGrant -AuthProviderUri <String> -Resource <String> -ClientId <String>
 -ClientSecret <String> [-Scope <String>] [-EnableException] [<CommonParameters>]
```

### v2
```
Invoke-ClientCredentialsGrant [-Resource <String>] -ClientId <String> -ClientSecret <String> -TenantId <String>
 -Scope <String> [-AuthEndpointV2] [-EnableException] [<CommonParameters>]
```

### v1
```
Invoke-ClientCredentialsGrant -Resource <String> -ClientId <String> -ClientSecret <String> -TenantId <String>
 [-Scope <String>] [-AuthEndpointV1] [-EnableException] [<CommonParameters>]
```

## DESCRIPTION
Invoke an OAuth 2.0 Client Credentials Grant flow against the authorization server

## EXAMPLES

### EXAMPLE 1
```
Invoke-ClientCredentialsGrant -AuthProviderUri "https://login.microsoftonline.com/e674da86-7ee5-40a7-b777-1111111111111/oauth2/token" -Resource "https://www.superfantasticservername.com" -ClientId "dea8d7a9-1602-4429-b138-111111111111" -ClientSecret "Vja/VmdxaLOPR+alkjfsadffelkjlfw234522="
```

This will invoke an OAuth Client Credentials Grant flow against Azure Active Directory for the tenant id "e674da86-7ee5-40a7-b777-1111111111111".
The token will be valid for the "https://www.superfantasticservername.com" resource.
The ClientId is "dea8d7a9-1602-4429-b138-111111111111".
The ClientSecret is "Vja/VmdxaLOPR+alkjfsadffelkjlfw234522="

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

### -ClientSecret
The Client Secret that you want to use for the authentication process

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
{{ Fill TenantId Description }}

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
{{ Fill AuthEndpointV1 Description }}

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
{{ Fill AuthEndpointV2 Description }}

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
