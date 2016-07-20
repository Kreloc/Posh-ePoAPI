---
external help file: Posh-ePoAPI-help.xml
online version: 
schema: 2.0.0
---

# Get-ePoTable
## SYNOPSIS
Gets table information using the ePo API.

## SYNTAX

```
Get-ePoTable [[-TableName] <String[]>] [-WhatIf] [-Confirm]
```

## DESCRIPTION
Sends the command specified to the McAfee EPO server.
Connect-ePoServer has to be run first,
as this function uses the epoServer global variable created by that functions connection to the server.
Uses the Invoke-ePoCommand

## EXAMPLES

### -------------------------- EXAMPLE 1 --------------------------
```
$ePoTables = Get-ePoTable
```

$ePoTables

Retruns the output of the core.listTables API command and stores the PowerShell custom object in a variable.

### -------------------------- EXAMPLE 2 --------------------------
```
$FoundTable = Get-ePoTable -TableName "MyTable"
```

Returns an object of the results of the core.listTables API command with a table name of MyTable.

## PARAMETERS

### -TableName
The database type-qualified name of the table to which view the details.
Defaults to all tables.

```yaml
Type: String[]
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
Added support for an array of strings for the TableName parameter
Added support for -Whatif

## RELATED LINKS

