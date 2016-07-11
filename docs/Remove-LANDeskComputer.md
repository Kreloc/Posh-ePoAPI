---
external help file: PSLANDesk-help.xml
online version: 
schema: 2.0.0
---

# Remove-LANDeskComputer
## SYNOPSIS
Removes specified computer from LANDesk.

## SYNTAX

```
Remove-LANDeskComputer [-ComputerName] <String[]> [-WhatIf] [-Confirm]
```

## DESCRIPTION
Removes specified computer from LANDesk.

## EXAMPLES

### -------------------------- EXAMPLE 1 --------------------------
```

```

Removes the computer specified for ComputerName.

### -------------------------- EXAMPLE 2 --------------------------
```
Remove-LANDesk -ComputerName "THATPC" -WhatIf
```

Removes the computer named THATPC but doesn't perform the action, instead displaying the WhatIf message.

### -------------------------- EXAMPLE 3 --------------------------
```
Get-Content computers.txt | Remove-LANDeskComputer
```

Remove each computername listed on each line of computers.txt

## PARAMETERS

### -ComputerName
The name or names of the computers to remove from the LANDesk database.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases: 

Required: True
Position: 1
Default value: 
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

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

## RELATED LINKS

