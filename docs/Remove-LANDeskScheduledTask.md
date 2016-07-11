---
external help file: PSLANDesk-help.xml
online version: 
schema: 2.0.0
---

# Remove-LANDeskScheduledTask
## SYNOPSIS
The Remove-LANDeskScheduledTask function removes the specified LANDesk task.

## SYNTAX

```
Remove-LANDeskScheduledTask [-ID] <Int32>
```

## DESCRIPTION
The Remove-LANDeskScheduledTask function removes the specified LANDesk task.
Requires the ID number of the task to check which can be found by right-clicking task, selecting info, and copying
the number in the ID field.
Alternatively, it can be obtained using Get-LANDeskTaskList function.

## EXAMPLES

### -------------------------- EXAMPLE 1 --------------------------
```
Remove-LANDeskScheduledTask -ID 877
```

Returns the status of the LANDesk Task with an ID of 877.

### -------------------------- EXAMPLE 2 --------------------------
```
Get-LANDeskTaskList | Where {$_.TaskName -like "*Adobe*"} | Remove-LANDeskScheduledTask
```

Returns the status of all Landesk tasks with Adobe in their name.
Get-LANDeskTaskList creates a list of all of the scheduled tasks on the LANDesk webserver.

### -------------------------- EXAMPLE 3 --------------------------
```
$oldServer = "LDCONT"
```

Get-LANDeskDistributionPackage | {$_.PackagePrimaryFile -like "*$oldServer*"}} | Select PackageName

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

