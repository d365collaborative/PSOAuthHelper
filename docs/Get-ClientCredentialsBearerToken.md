---
external help file: PSOAuthHelper-help.xml
Module Name: PSOAuthHelper
online version:
schema: 2.0.0
---

# Get-ClientCredentialsBearerToken

## SYNOPSIS
Get a bearer token

## SYNTAX

```
Get-ClientCredentialsBearerToken [-AuthProviderUri] <String> [-Resource] <String> [[-ClientId] <String>]
 [[-ClientSecret] <String>] [[-Scope] <String>] [-Raw] [<CommonParameters>]
```

## DESCRIPTION
Invoke an OAuth 2.0 Client Credentials Grant flow and extract the bearer token directly

## EXAMPLES

### EXAMPLE 1
```
Get-ClientCredentialsBearerToken -AuthProviderUri "https://login.microsoftonline.com/e674da86-7ee5-40a7-b777-1111111111111/oauth2/token" -Resource "https://www.superfantasticservername.com" -ClientId "dea8d7a9-1602-4429-b138-111111111111" -ClientSecret "Vja/VmdxaLOPR+alkjfsadffelkjlfw234522="
```

This will invoke an OAuth Client Credentials Grant flow against Azure Active Directory for the tenant id "e674da86-7ee5-40a7-b777-1111111111111".
The token will be valid for the "https://www.superfantasticservername.com" resource.
The ClientId is "dea8d7a9-1602-4429-b138-111111111111".
The ClientSecret is "Vja/VmdxaLOPR+alkjfsadffelkjlfw234522="

It will return a string formated like:
"Bearer eyJ0eXAiOiJKV1QiLCJhbGciOi....."

### EXAMPLE 2
```
Get-ClientCredentialsBearerToken -AuthProviderUri "https://login.microsoftonline.com/e674da86-7ee5-40a7-b777-1111111111111/oauth2/token" -Resource "https://www.superfantasticservername.com" -ClientId "dea8d7a9-1602-4429-b138-111111111111" -ClientSecret "Vja/VmdxaLOPR+alkjfsadffelkjlfw234522="
```

This will invoke an OAuth Client Credentials Grant flow against Azure Active Directory for the tenant id "e674da86-7ee5-40a7-b777-1111111111111".
The token will be valid for the "https://www.superfantasticservername.com" resource.
The ClientId is "dea8d7a9-1602-4429-b138-111111111111".
The ClientSecret is "Vja/VmdxaLOPR+alkjfsadffelkjlfw234522="

It will return a string formated like:
"eyJ0eXAiOiJKV1QiLCJhbGciOi....."

## PARAMETERS

### -AuthProviderUri
The URL / URI for the authorization server

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Resource
The URL / URI for the protected resource you want the token to be valid to

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 3
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

Required: False
Position: 5
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

Required: False
Position: 6
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Scope
The scope details that you want the token to valid for

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 9
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Raw
Instruct the cmdlets to return just the token value as a raw string

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
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable.
For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### System.String
## NOTES
Author: Mötz Jensen (@Splaxi)

## RELATED LINKS
