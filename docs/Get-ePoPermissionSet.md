---
external help file: Posh-ePoAPI-help.xml
online version: https://github.com/Kreloc
schema: 2.0.0
---

# Get-ePoPermissionSet
## SYNOPSIS
Gets users from ePo API.

## SYNTAX

```
Get-ePoPermissionSet [-WhatIf] [-Confirm]
```

## DESCRIPTION
Gets users from ePo API using the core.exportPermissionSets API command.

## EXAMPLES

### -------------------------- EXAMPLE 1 --------------------------
```
Get-ePoPermissionSet
```

Gets all of the permission sets returned by the core.exportPermissionSets API command.

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
Gets users using the core.exportPermissionSetes API Command.
Requires Global Administration access on ePoServer.
Still need to figure out how to parse \<roles\> infor in innerXml

## RELATED LINKS

[https://github.com/Kreloc](https://github.com/Kreloc)

