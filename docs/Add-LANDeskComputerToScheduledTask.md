---
external help file: PSLANDesk-help.xml
online version: 
schema: 2.0.0
---

# Add-LANDeskComputerToScheduledTask
## SYNOPSIS
The Add-LANDeskComputerToScheduledTask function adds the specified computer to the specified LANDesk task.

## SYNTAX

```
Add-LANDeskComputerToScheduledTask [-ComputerName] <String> [-ID] <Int32> [-WhatIf] [-Confirm]
```

## DESCRIPTION
The Add-LANDeskComputerToScheduledTask function adds the specified computer to the specified LANDesk task.
Requires the ID number of the task to check which can be found by right-clicking task, selecting info, and copying
the number in the ID field.
Requires the DeviceName of the target computer.

## EXAMPLES

### -------------------------- EXAMPLE 1 --------------------------
```
Add-LANDeskComputerToScheduledTask -ID 877 -ComputerName "THATPC"
```

Adds the computer named THATPC to the task with a task ID of 877 (LAAWorkStationAgent)

### -------------------------- EXAMPLE 2 --------------------------
```
Get-LANDeskComputer -Filter {$_.ComputerName -like "*lt*"} | Add-LANDeskComputerToScheduledTask -Id 877
```

Adds all of the computers that have a name with lt in it to the task with an ID of 877.
(LAAWorkStationAgent)

### -------------------------- EXAMPLE 3 --------------------------
```
Start-LANDeskQuery "Inventory Scanner Version" | Add-LANDeskComputerToScheduledTask -Id 877
```

Adds all of the computers returned by the Inventory Scanner Version query and adds them to the task with an ID of 877.
The query
is set to find computers with a version older than the most current.

## PARAMETERS

### -ComputerName
The ComputerName or DeviceName of the target computer to add to the scheduled task.

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
The ID of the task to add the computer to.

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

