---
external help file: Posh-ePoAPI-help.xml
online version: 
schema: 2.0.0
---

# Get-ePoGroupSystem
## SYNOPSIS
Finds a system or systems in an ePoGroup using the ePo API.

## SYNTAX

```
Get-ePoGroupSystem [-GroupID] <String[]> [-Recurse] [-WhatIf] [-Confirm]
```

## DESCRIPTION
Sends the command specified to the McAfee EPO server.
Connect-ePoServer has to be run first,
as this function uses the epoServer global variable created by that functions connection to the server.
Uses the Invoke-ePoCommand

## EXAMPLES

### -------------------------- EXAMPLE 1 --------------------------
```
$GroupPCs = Get-ePoGroupSystem -GroupId "519"
```

Retruns the output of the epogroup.findSystems API command for computers under GroupId number 519.

### -------------------------- EXAMPLE 2 --------------------------
```
$FoundSystems = Get-ePoGroupSystem -GroupId "519" -Recurse
```

Returns an object of the results of the systems in the Group with an ID of 519 including paths below the main one.

### -------------------------- EXAMPLE 3 --------------------------
```
$FoundSystems = Get-ePoGroup -Filter "Admin" | Get-ePoGroupSystem
```

This example first gets the GroupID using Get-ePGroup with a Filter for the word Admin and then pipes that GroupID
to find all of the computer systems under that group.

## PARAMETERS

### -GroupID
The Id of the group to search within.
Id number can be obtained by using Get-ePoGroup

```yaml
Type: String[]
Parameter Sets: (All)
Aliases: 

Required: True
Position: 1
Default value: 
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### -Recurse
A switch to search subgroups as well.
Defaults to false.
True needs to be inputted in lowercase like 'true'
The case sensitivity is part of the ePo API.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: 

Required: False
Position: Named
Default value: False
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
Logic added to get disk percent free space as property on object returned.
Added support for GroupId parameter to take an array of strings
Added support for Whatif

## RELATED LINKS

