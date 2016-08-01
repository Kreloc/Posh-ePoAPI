---
external help file: Posh-ePoAPI-help.xml
online version: https://github.com/Kreloc
schema: 2.0.0
---

# Start-ePoClientTask
## SYNOPSIS
Starts the specified client task on specified target system.

## SYNTAX

```
Start-ePoClientTask [-ComputerName] <String> [-TaskId] <Object> [-ProductId] <Object> [-WhatIf] [-Confirm]
```

## DESCRIPTION
Starts the specified client task on specified target system.
Requires the productId and taskId of the clienttask to run.
Uses the
         clienttask.run api command.

## EXAMPLES

### -------------------------- EXAMPLE 1 --------------------------
```
Start-ePoClientTask -ComputerName "THATPC" -ProductId "VIRUSCAN8800" -TaskId "111"
```

Starts a client task for a Full Scan - Normal priority on the computer named "THATPC"

### -------------------------- EXAMPLE 2 --------------------------
```
Get-ePoClientTask -Filter "Full scan - Normal Priority" | Start-ePoClientTask -ComputerName "THATPC"
```

First uses the Get-ePoClientTask function to find the correct client task and then pipes the TaskId and ProductId to 
         the Start-ePoClientTask function.

## PARAMETERS

### -ComputerName
The name of the computer to start the client task on.

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

### -TaskId
The id number of the client task to run.

```yaml
Type: Object
Parameter Sets: (All)
Aliases: 

Required: True
Position: 2
Default value: 
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -ProductId
The Product ID of the product to run with that task.

```yaml
Type: Object
Parameter Sets: (All)
Aliases: 

Required: True
Position: 3
Default value: 
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
Added support for -Whatif
TODO: Implement script wrapping this to start a virus scan on client as soon as Malware alert is triggered.

## RELATED LINKS

