---
external help file: PSLANDesk-help.xml
online version: 
schema: 2.0.0
---

# Get-LANDeskMachineVulnerabilities
## SYNOPSIS
The Get-LANDeskMachineVulnerabilities function returns the vulnerabilities for specified device.

## SYNTAX

```
Get-LANDeskMachineVulnerabilities [-GUID] <String>
```

## DESCRIPTION
The Get-LANDeskMachineVulnerabilities function returns the vulnerabilities for specified device and sorts them by severity.

## EXAMPLES

### -------------------------- EXAMPLE 1 --------------------------
```

```

Finds and returns vulnerabilities for the selected device.

### -------------------------- EXAMPLE 2 --------------------------
```
Get-LANDeskComputer -Filter {$_.ComputerName -like "Pre-*"} | Get-LANDeskMachineVulnerabilities
```

Returns vulnerabilies found for the all of the computers returned by Get-LANDeskComputers which will only be computers with names
starting with Pre-.

## PARAMETERS

### -GUID
The GUID of the device to check for vulnerabilities.
Obtained from running Get-LANDeskComputer

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

## INPUTS

## OUTPUTS

## NOTES
Still need to find documentation on what each return code means, specifically for the Reboot property.

## RELATED LINKS

