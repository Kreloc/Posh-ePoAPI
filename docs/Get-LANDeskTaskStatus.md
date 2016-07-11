---
external help file: PSLANDesk-help.xml
online version: 
schema: 2.0.0
---

# Get-LANDeskTaskStatus
## SYNOPSIS
The Get-LANDeskTaskStatus function returns the status of the specified LANDesk task.

## SYNTAX

```
Get-LANDeskTaskStatus [-ID] <Int32>
```

## DESCRIPTION
The Get-LANDeskTaskStatus function returns the status of the specified LANDesk task.
Requires the ID number of the task to check which can be found by right-clicking task, selecting info, and copying
the number in the ID field.

## EXAMPLES

### -------------------------- EXAMPLE 1 --------------------------
```
Get-LANDeskTaskStatus -ID 877
```

Returns the status of the LANDesk Task with an ID of 877.

### -------------------------- EXAMPLE 2 --------------------------
```
Get-LANDeskTaskList | Where {$_.TaskName -like "*Adobe*"} | Get-LANDeskTaskStatus
```

Returns the status of all Landesk tasks with Adobe in their name.
Get-LANDeskTaskList creates a list of all of the scheduled tasks on the LANDesk webserver.

## PARAMETERS

### -ID
The ID of the task to check the status on.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases: TaskID

Required: True
Position: 1
Default value: 0
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS

