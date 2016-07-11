---
external help file: PSLANDesk-help.xml
online version: 
schema: 2.0.0
---

# Remove-LANDeskComputerFromScheduledTask
## SYNOPSIS
The Remove-LANDeskComputerFromScheduledTask function removes the specified computer from the specified LANDesk task.

## SYNTAX

```
Remove-LANDeskComputerFromScheduledTask [-ComputerName] <String> [-ID] <Int32> [-WhatIf] [-Confirm]
```

## DESCRIPTION
The Remove-LANDeskComputerFromScheduledTask function removes the specified computer from the specified LANDesk task.
Requires the ID number of the task to check which can be found by right-clicking task, selecting info, and copying the number in the ID field.
Requires the DeviceName of the target computer.

## EXAMPLES

### -------------------------- EXAMPLE 1 --------------------------
```
Remove-LANDeskComputerFromScheduledTask -ID 877 -ComputerName "THATPC"
```

Removes the computer named THATPC from the task with a task ID of 877 (LAAWorkStationAgent)
         Returns a Boolean as output.

### -------------------------- EXAMPLE 2 --------------------------
```
Get-LANDeskComputer -Filter {$_.ComputerName -like "*lt*"} | Remove-LANDeskComputerFromScheduledTask -Id 877
```

Removes all of the computers that have a name with lt in it from the task with an ID of 877.
(LAAWorkStationAgent)

## PARAMETERS

### -ComputerName
The ComputerName or DeviceName of the target computer to remove from the scheduled task.

```yaml
Type: String
Parameter Sets: (All)
Aliases: Device Name

Required: True
Position: 1
Default value: 
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### -ID
The ID of the task to remove the computer from.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases: TaskID

Required: True
Position: 2
Default value: 0
Accept pipeline input: True (ByPropertyName)
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

