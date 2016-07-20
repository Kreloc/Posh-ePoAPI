---
external help file: Posh-ePoAPI-help.xml
online version: 
schema: 2.0.0
---

# Start-ePoQuery
## SYNOPSIS
Runs a query using the ePo API.

## SYNTAX

### QueryID
```
Start-ePoQuery -QueryId <Object> [-WhatIf] [-Confirm]
```

### QueryName
```
Start-ePoQuery -QueryName <Object> [-WhatIf] [-Confirm]
```

## DESCRIPTION
Sends the command specified to the McAfee EPO server.
Connect-ePoServer has to be run first,
as this function uses the epoServer global variable created by that functions connection to the server.
Uses the Invoke-ePoCommand

## EXAMPLES

### -------------------------- EXAMPLE 1 --------------------------
```
Start-ePoQuery -QueryName "Duplicate Systems Names" -Verbose
```

Returns the output of the query named Duplicate Systems Name

### -------------------------- EXAMPLE 2 --------------------------
```
$ePoQueries = Get-ePoQuery
```

$QueryResults = $ePoQueries | Where {$_.Description -like "*unmanaged*"} | Start-ePoQuery
      $QueryResults

Retruns the output of the core.listQueries API command and stores the PowerShell custom object in a variable $ePoQueries.
      This is then piped to where-object to find queries with a description with unmanged in it.
      This in then piped in turn to the Start-ePoQuery and the results are stored in a variable.

## PARAMETERS

### -QueryId
The ID number of the query to be run.

```yaml
Type: Object
Parameter Sets: QueryID
Aliases: 

Required: True
Position: Named
Default value: 
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### -QueryName
{{Fill QueryName Description}}

```yaml
Type: Object
Parameter Sets: QueryName
Aliases: 

Required: True
Position: Named
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
Added logic that gets all queries so a QueryName parameter can be used instead of only the QueryId parameter.
TODO: Determine if I should change the name of this function and incorporate Get-ePoQuery into it as a parameter.

## RELATED LINKS

