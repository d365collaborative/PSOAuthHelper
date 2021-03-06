﻿---
external help file: PSOAuthHelper-help.xml
Module Name: PSOAuthHelper
online version:
schema: 2.0.0
---

# Invoke-RefreshToken

## SYNOPSIS
Invoke a refresh token authorization flow

## SYNTAX

### Object
```
Invoke-RefreshToken [-AuthProviderUri] <String> [-ClientId] <String> [[-InputObject] <PSObject>]
 [-EnableException] [<CommonParameters>]
```

### Simple
```
Invoke-RefreshToken [-AuthProviderUri] <String> [-ClientId] <String> [-RefreshToken] <String>
 [-EnableException] [<CommonParameters>]
```

## DESCRIPTION
Invoke an OAuth 2.0 Refresh Token Grant flow against the authorization server

## EXAMPLES

### EXAMPLE 1
```
Invoke-RefreshToken -AuthProviderUri "https://login.microsoftonline.com/common/oauth2/token" -ClientId "dea8d7a9-1602-4429-b138-111111111111" -RefreshToken "Tsdljfasfe2j32324"
```

This will invoke an Refresh Token Grant flow against Azure Active Directory for the common endpoint.
The ClientId is "dea8d7a9-1602-4429-b138-111111111111".
The RefreshToken is "Tsdljfasfe2j32324".

## PARAMETERS

### -AuthProviderUri
The URL / URI for the authorization server

```yaml
Type: String
Parameter Sets: Object
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

```yaml
Type: String
Parameter Sets: Simple
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ClientId
The Client Id that you want to use for the authentication process

```yaml
Type: String
Parameter Sets: Object
Aliases:

Required: True
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

```yaml
Type: String
Parameter Sets: Simple
Aliases:

Required: True
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -RefreshToken
The Refresh Token that you want to use for the authentication process

```yaml
Type: String
Parameter Sets: Simple
Aliases: Token, refresh_token

Required: True
Position: 4
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -InputObject
The object you received from any of the Invoke-* commands that returns an access token

```yaml
Type: PSObject
Parameter Sets: Object
Aliases:

Required: False
Position: 4
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
Tags: Refresh, Token, ClientId

Author: Mötz Jensen (@Splaxi)

## RELATED LINKS

[Invoke-PasswordGrant]()

