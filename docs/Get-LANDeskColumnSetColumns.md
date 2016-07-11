---
external help file: PSLANDesk-help.xml
online version: 
schema: 2.0.0
---

# Get-LANDeskColumnSetColumns
## SYNOPSIS
The Get-LANDeskColumnSetColumns function returns a list of available Column sets.

## SYNTAX

```
Get-LANDeskColumnSetColumns [-Name] <String>
```

## DESCRIPTION
The Get-LANDeskColumnSetColumns function returns a list of available Column sets.
This can be used to determine the columns available to each set.

## EXAMPLES

### -------------------------- EXAMPLE 1 --------------------------
```
Get-LANDeskColumnSetColumns -ColumnSetName "Mark"
```

Returns a list of available columns in the column set named Mark.

## PARAMETERS

### -Name
The Name of the ColumnSet to retrieve the columns from.

```yaml
Type: String
Parameter Sets: (All)
Aliases: ColumnSetName

Required: True
Position: 1
Default value: 
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS

