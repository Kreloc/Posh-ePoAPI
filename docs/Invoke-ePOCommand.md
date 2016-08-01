---
external help file: Posh-ePoAPI-help.xml
online version: https://github.com/Kreloc
schema: 2.0.0
---

# Invoke-ePOCommand
## SYNOPSIS
Sends the command specified to the McAfee EPO server.

## SYNTAX

```
Invoke-ePOCommand [-Command] <String> [[-Parameters] <String[]>] [-WhatIf] [-Confirm]
```

## DESCRIPTION
Sends the command specified to the McAfee EPO server.
Connect-ePoServer has to be run first,
as this function uses the epoServer script variable created by that functions connection to the server as well as the 
         credentials script variable.
         This function is the main piece of the entire POSH-ePoAPI module.

## EXAMPLES

### -------------------------- EXAMPLE 1 --------------------------
```
$CurrentPC = Invoke-ePOCommand -Command "system.find" -Parameters "searchText=$($env:computername)"
$CurrentPC.result.list.row
```

Retruns the output of the system.find API command with a search paramter for the current computer.

## PARAMETERS

### -Command
The command to send to the McAfee EPO API.

```yaml
Type: String
Parameter Sets: (All)
Aliases: 

Required: True
Position: 1
Default value: 
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### -Parameters
{{Fill Parameters Description}}

```yaml
Type: String[]
Parameter Sets: (All)
Aliases: 

Required: False
Position: 2
Default value: 
Accept pipeline input: False
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
Changed from System.Net.Webclient to using Invoke-RestMethod

## RELATED LINKS

