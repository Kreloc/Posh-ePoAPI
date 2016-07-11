---
external help file: PSLANDesk-help.xml
online version: 
schema: 2.0.0
---

# Get-LANDeskQueries
## SYNOPSIS
The Get-LANDeskQueries function returns a list of queries available to be run.

## SYNTAX

```
Get-LANDeskQueries
```

## DESCRIPTION
A detailed description of the Get-LANDeskQueries function.

## EXAMPLES

### -------------------------- EXAMPLE 1 --------------------------
```
Get-LANDeskQueries
```

Returns a list of LANDesk queries.

### -------------------------- EXAMPLE 2 --------------------------
```
$ListOfQueries = Get-LANDeskQueries
```

$ListOfQueries | Where-Object {$_.QueryName -eq "Current Machines  (scan\>10/9/2015)"}

Returns only the query name specified in the Where-Object section of the pipe.
This could then be piped directly to the
Start-LANDeskQuery function included in the PSLANDeskModule.

## PARAMETERS

## INPUTS

## OUTPUTS

## NOTES
Working on integrating Out-Gridview for selecting the query.

## RELATED LINKS

