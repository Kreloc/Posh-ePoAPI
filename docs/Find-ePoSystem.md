---
external help file: Posh-ePoAPI-help.xml
online version: 
schema: 2.0.0
---

# Find-ePoSystem
## SYNOPSIS
Finds a system using the ePo API.

## SYNTAX

```
Find-ePoSystem [[-Filter] <String>] [-WhatIf] [-Confirm]
```

## DESCRIPTION
Sends the command specified to the McAfee EPO server.
Connect-ePoServer has to be run first,
as this function uses the epoServer global variable created by that functions connection to the server.
Uses the Invoke-ePoCommand

## EXAMPLES

### -------------------------- EXAMPLE 1 --------------------------
```
$CurrentPC = Find-ePoSystem -Filter $env:computername
$CurrentPC
```

Retruns the output of the system.find API command with a search paramter for the current computer.

### -------------------------- EXAMPLE 2 --------------------------
```
$FoundSystems = Find-ePoSystem -Filter "lt"
```

Returns an object of the results of the system.find search for systems with lt in their names.

### -------------------------- EXAMPLE 3 --------------------------
```
$AllSystems = Find-ePoSystem -Verbose
```

Returns an object of the results of the system.find search for all systems.

## PARAMETERS

### -Filter
The search string to use for finding a system.
Defaults to a space, which returns all systems.

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
Added logic to determine the Percent of disk space left on each system.
Added support for Whatif
Changed to using ArrayList

## RELATED LINKS

