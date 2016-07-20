---
external help file: Posh-ePoAPI-help.xml
online version: 
schema: 2.0.0
---

# Find-ePoDetectedSystem
## SYNOPSIS
Finds a system using the ePo API.

## SYNTAX

```
Find-ePoDetectedSystem [[-Filter] <String>] [-WhatIf] [-Confirm]
```

## DESCRIPTION
Sends the command specified to the McAfee EPO server.
Connect-ePoServer has to be run first,
as this function uses the epoServer global variable created by that functions connection to the server.
Uses the Invoke-ePoCommand

## EXAMPLES

### -------------------------- EXAMPLE 1 --------------------------
```
$CurrentPC = Find-ePoDetectedSystem -Filter $env:computername
```

$CurrentPC

Retruns the output of the system.find API command with a search paramter for the current computer.

### -------------------------- EXAMPLE 2 --------------------------
```
$FoundSystems = Find-ePoDetectedSystem -Filter "Mark"
```

Returns an object of the results of the system.find search for systems with Mark as their user.

### -------------------------- EXAMPLE 3 --------------------------
```
$DomainFoundDetectedSystems = Find-ePoDetectedSystem -Filter "contonoso.com"
```

$DomainFoundDetectedSystems

Finds all of the detectedsystems with contonoso.com as their domain.

### -------------------------- EXAMPLE 4 --------------------------
```
Find-ePoDetectedSystem -Verbose
```

Finds all of the detecedsystems.

## PARAMETERS

### -Filter
The search string to use for finding the detected system.
This can be the DNS Name, Domain, NetBIOS information, User or IPv4 or IPv6 address.
         Defaults to a space which returns all of the detected systems.

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
Added support for Whatif

## RELATED LINKS

