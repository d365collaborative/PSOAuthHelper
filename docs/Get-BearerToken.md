---
external help file: PSOAuthHelper-help.xml
Module Name: PSOAuthHelper
online version:
schema: 2.0.0
---

# Get-BearerToken

## SYNOPSIS
Get a bearer token string

## SYNTAX

```
Get-BearerToken [-InputObject] <PSObject> [-Raw] [<CommonParameters>]
```

## DESCRIPTION
Easy way to create a bearer token string from a object

## EXAMPLES

### EXAMPLE 1
```
Invoke-ClientCredentialsGrant -AuthProviderUri "https://login.microsoftonline.com/e674da86-7ee5-40a7-b777-1111111111111/oauth2/token" -Resource "https://www.superfantasticservername.com" -ClientId "dea8d7a9-1602-4429-b138-111111111111" -ClientSecret "Vja/VmdxaLOPR+alkjfsadffelkjlfw234522=" | Get-BearerToken
```

This will run the Invoke-ClientCredentialsGrant cmdlet with all the needed parameters.
Then it will pass the output to the Get-BearerToken through the pipeline.

## PARAMETERS

### -InputObject
The object you received from any of the Invoke-* commands that returns an access token

```yaml
Type: PSObject
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: True (ByValue)
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
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### System.String
## NOTES
Tags: BearerToken, Token, AccessToken, Bearer

Author: Mötz Jensen (@Splaxi)

## RELATED LINKS

[Invoke-ClientCredentialsGrant]()

[Invoke-PasswordGrant]()

[Invoke-RefreshToken]()

