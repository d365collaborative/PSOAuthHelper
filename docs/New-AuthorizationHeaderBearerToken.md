---
external help file: PSOAuthHelper-help.xml
Module Name: PSOAuthHelper
online version:
schema: 2.0.0
---

# New-AuthorizationHeaderBearerToken

## SYNOPSIS
Get an authorization header

## SYNTAX

```
New-AuthorizationHeaderBearerToken [-URL] <String> [-BearerToken] <String> [<CommonParameters>]
```

## DESCRIPTION
Get a valid HTTP header with the needed authorization details filled out for a bearer token

## EXAMPLES

### EXAMPLE 1
```
New-AuthorizationHeaderBearerToken -URL "https://www.superfantasticservername.com" -BearerToken "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOi....."
```

This will return a hashtable with the Authorization and Host elements filled out.

## PARAMETERS

### -URL
URI / URL for the endpoint that you want the header to be valid for

```yaml
Type: String
Parameter Sets: (All)
Aliases: URI

Required: True
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -BearerToken
The token value received from your earlier OAuth 2.0 flow

```yaml
Type: String
Parameter Sets: (All)
Aliases: access_token

Required: True
Position: 3
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### System.Collections.Hashtable
## NOTES
Tags: Header, Token, Bearer, Authorization

Author: Mötz Jensen (@Splaxi)

## RELATED LINKS
