---
external help file: Posh-ePoAPI-help.xml
online version: 
schema: 2.0.0
---

# Get-ePoClientTask
## SYNOPSIS
Gets client task information based on filter parameter.

## SYNTAX

```
Get-ePoClientTask [[-Filter] <String>] [-WhatIf] [-Confirm]
```

## DESCRIPTION
Gets client task information based on filter parameter.
Uses the clienttask.find api command

## EXAMPLES

### -------------------------- EXAMPLE 1 --------------------------
```
Get-ePoClientTask -Filter "Full scan - Normal Priority"
```

Returns information about the client task with Full scan - Normal Priority in the task name.

### -------------------------- EXAMPLE 2 --------------------------
```
Get-ePoClientTask -Filter "scan"
```

Returns information about client tasks with scan in the task name.

### -------------------------- EXAMPLE 3 --------------------------
```
$UpdateClientTasks = Get-ePoClientTask -Filter "update"
$DatUpdateTask = $UpdateClientTasks | Where {$_.TaskName -like "DAT Update"}
$DatUpdateTask | Start-ePoClientTask -ComputerName "NEEDSDAT-UPDT"
```

First gets information about clients tasks with update in the task name and stores it in a variable.
Then filters that variable to Where-Object, for tasks with a name like DAT Update and stores it in a variable.
Finally, it pipes that variable to Start-ePoClientTask, starting the Dat update client task on the computer named NEEDSDAT-UPDT.

### -------------------------- EXAMPLE 4 --------------------------
```
Get-ePoClientTask -Verbose
```

Gets all of the Client tasks on the ePo server.

## PARAMETERS

### -Filter
The search string to use for finding the client task.
Defaults to a space, which returns all of
         the client tasks.

```yaml
Type: String
Parameter Sets: (All)
Aliases: 

Required: False
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
Can be used with to filter for a client task and then pipe the results to the Start-ePoClientTask.
Added support for -Whatif

## RELATED LINKS

