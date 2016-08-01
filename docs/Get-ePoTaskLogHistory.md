---
external help file: Posh-ePoAPI-help.xml
online version: https://github.com/Kreloc
schema: 2.0.0
---

# Get-ePoTaskLogHistory
## SYNOPSIS
Gets the task log history from the McAfee server.

## SYNTAX

```
Get-ePoTaskLogHistory [[-taskId] <Object>] [[-maxRows] <Object>] [[-age] <Object>] [[-unit] <Object>] [-WhatIf]
 [-Confirm]
```

## DESCRIPTION
Gets the task log history from the McAfee server.
Uses the tasklog.listTaskHistory api command.
         This function is still a Work in Progress.

## EXAMPLES

### -------------------------- EXAMPLE 1 --------------------------
```
Get-ePoTaskLogHistory
```

Gets the ePoTask log history from the McAfee server.

## PARAMETERS

### -taskId
The Id of the task to search the logs for.

```yaml
Type: Object
Parameter Sets: (All)
Aliases: 

Required: False
Position: 1
Default value: 
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### -maxRows
The maximum number of rows to return.

```yaml
Type: Object
Parameter Sets: (All)
Aliases: 

Required: False
Position: 2
Default value: 
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -age
The age of the logs to search for.

```yaml
Type: Object
Parameter Sets: (All)
Aliases: 

Required: False
Position: 3
Default value: 
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -unit
The unit of measurement for the age parameter

```yaml
Type: Object
Parameter Sets: (All)
Aliases: 

Required: False
Position: 4
Default value: 
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
This function is still a work in progress.
Parameters are still a work in progress for this function.
Please only use it without the parameters.
Added support for Whatif
TODO: Add support for other parameters.

## RELATED LINKS

