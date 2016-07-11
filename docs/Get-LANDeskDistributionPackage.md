---
external help file: PSLANDesk-help.xml
online version: 
schema: 2.0.0
---

# Get-LANDeskDistributionPackage
## SYNOPSIS
The Get-LANDeskDistributionPackage function returns a list of Distribution packages on the LANDesk Core Server.

## SYNTAX

```
Get-LANDeskDistributionPackage
```

## DESCRIPTION
The Get-LANDeskDistributionPackage function returns a list of Distribution packages on the LANDesk Core Server.

## EXAMPLES

### -------------------------- EXAMPLE 1 --------------------------
```
Get-LANDeskDistributionPackage
```

Returns a list of LANDesk distribution packages.

### -------------------------- EXAMPLE 2 --------------------------
```
Get-LANDeskDistributionPackage | Where {$_.PackageName -notlike "*My distribution*"}
```

Returns only the distribution packages that aren't like My distribution in the package name.

## PARAMETERS

## INPUTS

## OUTPUTS

## NOTES
Working on finding an actual use for this information

## RELATED LINKS

