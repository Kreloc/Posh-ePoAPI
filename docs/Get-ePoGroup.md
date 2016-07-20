---
external help file: Posh-ePoAPI-help.xml
online version: 
schema: 2.0.0
---

# Get-ePoGroup
## SYNOPSIS
Gets ePoGroup information using the ePo API.

## SYNTAX

```
Get-ePoGroup [[-Filter] <String>] [-WhatIf] [-Confirm]
```

## DESCRIPTION
Sends the command specified to the McAfee EPO server.
Connect-ePoServer has to be run first,
as this function uses the epoServer global variable created by that functions connection to the server.
Uses the Invoke-ePoCommand

## EXAMPLES

### -------------------------- EXAMPLE 1 --------------------------
```
$ePoGroups = Get-ePoGroup
```

$CurrentPC

Retruns the output of the system.findGroups API command and stores the results in a variable.

### -------------------------- EXAMPLE 2 --------------------------
```
$FoundSystems = Get-ePoGroup -Filter "Admin"
```

Returns an object of the results of the system.findGroups search for groups with Admin in their names.

## PARAMETERS

### -Filter
Search text, wildcards are not supported.
Defaults to all groups.

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
Requires Connect-ePoServer to have been run first.
All output is returned as a string currently, still looking
into ways to convert it to an object.
         Added support for Whatif

## RELATED LINKS

