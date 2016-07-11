---
external help file: PSLANDesk-help.xml
online version: 
schema: 2.0.0
---

# Get-LANDeskMachineData
## SYNOPSIS
Retrieves more detailed information about the computer specified by the GUID parameter from the LANDeskWebService object.

## SYNTAX

```
Get-LANDeskMachineData [-GUID] <String> [[-ColumnSetName] <String>]
```

## DESCRIPTION
Retrieves more detailed information about the computer specified by the GUID parameter.

## EXAMPLES

### -------------------------- EXAMPLE 1 --------------------------
```
$LANDeskComputers | Where {$_.ComputerName -eq "THATPC"} | Get-LANDeskMachineData -ColumnSetName "Mark"
```

Returns machine information on the the computer named THATPC.
Will return all of the information viewable from the Columns set
Mark.

### -------------------------- EXAMPLE 2 --------------------------
```
$results = Get-LANDeskComputer -Filter {$_.ComputerName -like "ns-ldp*"} | Get-LANDeskMachineData -ColumnSetName "Other"
```

Pipes the GUIDs of all the computers with a name beginning with ns-ldp into the function and
Stores the results of the GetMachineDataEX method call using the column setnamed Other into the variable named $results.

## PARAMETERS

### -GUID
The GUID of the LANDeskComputer to obtain Machine Data for from the LANDesk WebService.

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

### -ColumnSetName
{{Fill ColumnSetName Description}}

```yaml
Type: String
Parameter Sets: (All)
Aliases: 

Required: False
Position: 2
Default value: Mark
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS

