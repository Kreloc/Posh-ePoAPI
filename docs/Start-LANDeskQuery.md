---
external help file: PSLANDesk-help.xml
online version: 
schema: 2.0.0
---

# Start-LANDeskQuery
## SYNOPSIS
The Start-LANDeskQuery function runs the specified LANDesk query and returns the results.

## SYNTAX

```
Start-LANDeskQuery [-QueryName] <String> [-WhatIf] [-Confirm]
```

## DESCRIPTION
The Start-LANDeskQuery function runs the specified LANDesk query and returns the results using the Webservice object.

## EXAMPLES

### -------------------------- EXAMPLE 1 --------------------------
```
Start-LANDeskQuery "NewQuery"
```

Runs the NewQuery query and returns the results.

## PARAMETERS

### -QueryName
The name of the query to run.

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

## RELATED LINKS

