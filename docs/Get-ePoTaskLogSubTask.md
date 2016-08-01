---
external help file: Posh-ePoAPI-help.xml
online version: https://github.com/Kreloc
schema: 2.0.0
---

# Get-ePoTaskLogSubTask
## SYNOPSIS
The Get-ePoTaskLogSubTask gets information about the taskID specified.

## SYNTAX

```
Get-ePoTaskLogSubTask [-taskId] <Int32[]> [-WhatIf] [-Confirm]
```

## DESCRIPTION
The Get-ePoTaskLogSubTask gets information about the taskID specified.
Needs Connect-ePoServer to have been run
         and uses the Invoke-ePoCommand function.

## EXAMPLES

### -------------------------- EXAMPLE 1 --------------------------
```
Get-ePoTaskLogSubTask -taskId 111
```

Gets information about the task with an Id of 111.

## PARAMETERS

### -taskId
The ID number of the task to find information about.

```yaml
Type: Int32[]
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
This function is still a work in progress.
         Added support for an array of integers being passed to the taskId parameter.
         Added custom error handling.
Uses Write-Warning to display the Error if the taskID does not exists but should continue to the next one if another is specified.
         Added support for Whatif

## RELATED LINKS

