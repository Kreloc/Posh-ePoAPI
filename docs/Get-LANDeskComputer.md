---
external help file: PSLANDesk-help.xml
online version: 
schema: 2.0.0
---

# Get-LANDeskComputer
## SYNOPSIS
The Get-LANDeskComputer function creates the gloabl variable $LANDeskComputers if it doesn't yet exist.
This is all of the computers returned by the ListMachines
method of the LANDesk Web Service object.
The function then return output based on whether the Filter or Identity parameter is used.

## SYNTAX

### All (Default)
```
Get-LANDeskComputer [-List <String>]
```

### Filter
```
Get-LANDeskComputer [-Filter <ScriptBlock>]
```

### Identity
```
Get-LANDeskComputer [-Identity <String>]
```

## DESCRIPTION
The Get-LANDeskComputer function creates the gloabl variable $LANDeskComputers if it doesn't yet exist.
This is all of the computers returned by the ListMachines
method of the LANDesk Web Service object.
The function then return output based on whether the Filter or Identity parameter is used.
Uses Where-Object filtering 
on the global LANDeskComputers variable.
This function retrieves the GUID of each computer which is used in other functions in the LANDesk module.

## EXAMPLES

### -------------------------- EXAMPLE 1 --------------------------
```
Get-LANDeskComputer
```

Returns all of the computers returned by the ListMachines method of the LANdesk WebService object.

### -------------------------- EXAMPLE 2 --------------------------
```
Get-LANDeskComputer -Identity "$env:computername"
```

Returns the landesk information for the computer running the function.

## PARAMETERS

### -List
{{Fill List Description}}

```yaml
Type: String
Parameter Sets: All
Aliases: 

Required: False
Position: Named
Default value: List
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Filter
Specifies a query string that retrieves LANDesk computer objects.
This string uses the PowerShell Expression
Language syntax.
The PowerShell Expression Language syntax provides rich type-conversion support for value types
received by the Filter parameter.
The syntax uses an in-order representation, which means that the operator is
placed between the operand and the value.

Examples:
The following examples show use to use this syntax with this function.

Get-LANDeskComputer -Filter *
Returns all LANDeskComputer objects.
Ignore this example, still working on getting it to perform correctly.
Instead just run Get-LANDeskComputer with no paramters to retrieve the same results.

Get-LANDeskComputer -Filter {$_.ComputerName -like "*"}

Returns all LANDeskComputer objects.

Get-LANDeskComputer -Filter {$_.ComputerName -like "Pre-*"}

Returns all LANDeskComputer objects that have a computername beginning with Pre-

Get-LANDeskComputer -Filter {$_.IPAddress -like "192.168.028*"}

Returns all LANDeskComputer objects that have an IPAddress beginning with 192.168.028 (The 0 is necessary due to how LANDesk stores the IPAddress information.)

Get-LANDeskComputer -Filter {$_.SubNetMask -eq "255.255.248.000"}

Returns all LANDeskComputer objects that have a SubnetMask equal to 255.255.248.000

Get-LANDeskComputer -Filter {$_.LastLogin -eq "ADMINISTRATOR"}

Returns all LANDeskComputer obejcts where the LastLogin value is equal to ADMINISTRATOR

Get-LANDeskComputer -Filter '$_.OSName -notlike "Microsoft Windows 7*"'

Returns all LANDeskComputer objects where the Operating System is not Windows 7

```yaml
Type: ScriptBlock
Parameter Sets: Filter
Aliases: 

Required: False
Position: Named
Default value: 
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Identity
{{Fill Identity Description}}

```yaml
Type: String
Parameter Sets: Identity
Aliases: ComputerName, IPAddress, MACAddress, GUID

Required: False
Position: Named
Default value: 
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS

