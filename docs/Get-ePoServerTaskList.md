---
external help file: Posh-ePoAPI-help.xml
online version: 
schema: 2.0.0
---

# Get-ePoServerTaskList
## SYNOPSIS
Gets ePoServer Task information using the ePo API.

## SYNTAX

```
Get-ePoServerTaskList [-WhatIf] [-Confirm]
```

## DESCRIPTION
Sends the command specified to the McAfee EPO server.
Connect-ePoServer has to be run first,
as this function uses the epoServer global variable created by that functions connection to the server.
Uses the Invoke-ePoCommand

## EXAMPLES

### -------------------------- EXAMPLE 1 --------------------------
```
$ServerTaskList = Get-ePoServerTaskList
```

Returns an object of the results of the system.findGroups search for groups with Admin in their names.

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
Added logic to change true/false strings returned by API into boolean $True or $False values.
Added logic to change date strings into DateTime objects.
Added support for Whatif

## RELATED LINKS

