---
external help file: Posh-ePoAPI-help.xml
online version: 
schema: 2.0.0
---

# Get-ePoCommandHelp
## SYNOPSIS
This returns the help for the specified command made available by the API.

## SYNTAX

```
Get-ePoCommandHelp [[-Command] <String[]>] [-WhatIf] [-Confirm]
```

## DESCRIPTION
This returns the help for the specified command made available by the API.
Requires an active connection to the EpoServer.

## EXAMPLES

### -------------------------- EXAMPLE 1 --------------------------
```
Get-ePoCommandHelp
```

This will get a list of avaiable commands and their associated commandtext from the API.

### -------------------------- EXAMPLE 2 --------------------------
```
Get-ePoCommandHelp -Command "system.find" | Format-List
```

Gets the help for the command system.find outputted into the Format-List Cmdlet

### -------------------------- EXAMPLE 3 --------------------------
```
$DetectedSystemAddHelp = Get-ePoCommandHelp -Command "detectedsystem.add"
```

$DetectdSystemAddHelp.CommandUse

Gets the help for the command detectedsystem.add and stores it in a variable.
Then the property CommandUse is expanded.
The ParameterValues
property returns all of the parameters.
Still working on getting the ParameterName to return the paramters that aren't on the first line.
Any parameter in \[\] is optional.

### -------------------------- EXAMPLE 4 --------------------------
```
$ePoCommands | Where {$_.Command -like "*Computer*"} | Get-ePoCommandHelp
```

This will get the help for each command found with Computer in the command name.
Uses the script variable $ePoCommands that was created
either by Connect-ePoServer or by running this function with the Command parameter set to All.

## PARAMETERS

### -Command
The command to get help for.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases: 

Required: False
Position: 1
Default value: All
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
Can be used to list available ePoCommands by not specifying any parameters.
Added support for an array of strings being used in the Command parameter.
Added support for Whatif

## RELATED LINKS

