---
external help file: PSOAuthHelper-help.xml
Module Name: PSOAuthHelper
online version:
schema: 2.0.0
---

# Get-RemainingMinutes

## SYNOPSIS
Get how many minutes there is left of on token

## SYNTAX

```
Get-RemainingMinutes [-InputObject] <PSObject> [<CommonParameters>]
```

## DESCRIPTION
Pass the token object directly into the cmdlet and see how many minutes are left before the token expires

## EXAMPLES

### EXAMPLE 1
```
Get-RemainingMinutes -InputObject $TokenObject
```

## PARAMETERS

### -InputObject
The token object received from you invoke-* cmdlets

```yaml
Type: PSObject
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable.
For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES
Tags: Token, Expiration, Expire

Author: Mötz Jensen (@Splaxi)

## RELATED LINKS

[Invoke-ClientCredentialsGrant]()

[Invoke-PasswordGrant]()

[Invoke-RefreshToken]()

