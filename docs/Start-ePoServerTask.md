---
external help file: Posh-ePoAPI-help.xml
online version: https://github.com/Kreloc
schema: 2.0.0
---

# Start-ePoServerTask
## SYNOPSIS
Starts the specified server task.

## SYNTAX

```
Start-ePoServerTask [-TaskID] <Object> [-WhatIf] [-Confirm]
```

## DESCRIPTION
Starts the specified server task.
Requires the taskId of the servertask to run.
Uses the
         scheduler.runServerTask api command.

## EXAMPLES

### -------------------------- EXAMPLE 1 --------------------------
```
Start-ePoServerTask -TaskID 26
```

Starts the server task with an ID of 26.
This is the AD Sync task in my environment.

### -------------------------- EXAMPLE 2 --------------------------
```
$RunServerTasks = Get-ePoServerTaskList | Where {$_.Name -match "DAT update"} | Start-ePoServerTask
$RunServerTasks | Get-ePoTaskLogHistory
```

First uses the Get-ePoServerTaskList function to find the server task(s) that have name(s) that match DAT update and then pipes the TaskId to 
         the Start-ePoServerTask function.
The result object is stored in the variable $RunServerTasks.
         This variable is piped to Get-ePoTaskLogHistory, which uses the TaskID property of $RunServerTasks, to retrieve the TaskLog history for the server task(s)
         just run.

## PARAMETERS

### -TaskID
The id number of the server task to run.

```yaml
Type: Object
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
Added support for -Whatif

## RELATED LINKS

