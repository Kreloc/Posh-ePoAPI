---
external help file: Posh-ePoAPI-help.xml
online version: https://github.com/Kreloc
schema: 2.0.0
---

# Get-ePoUser
## SYNOPSIS
Gets users from ePo API.

## SYNTAX

```
Get-ePoUser [-WhatIf] [-Confirm]
```

## DESCRIPTION
Gets users from ePo API using the core.listUsers API command.

## EXAMPLES

### -------------------------- EXAMPLE 1 --------------------------
```
Get-ePoUser
```

Gets all of the users returned by the core.listUsers API command.

## PARAMETERS

### -WhatIf
{{Fill WhatIf Description}}

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: wi

Required: False
Position: Named
Default value: 
Accept pipeline input: False
Accept wildcard characters: False
```

### -Confirm
{{Fill Confirm Description}}

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: cf

Required: False
Position: Named
Default value: 
Accept pipeline input: False
Accept wildcard characters: False
```

## INPUTS

## OUTPUTS

## NOTES
Gets users using the core.listUsers API Command.
Requires Global Administration access on ePoServer.

## RELATED LINKS

[https://github.com/Kreloc](https://github.com/Kreloc)

