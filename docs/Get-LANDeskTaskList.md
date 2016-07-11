---
external help file: PSLANDesk-help.xml
online version: 
schema: 2.0.0
---

# Get-LANDeskTaskList
## SYNOPSIS
Lists the tasks on the landesk server.

## SYNTAX

```
Get-LANDeskTaskList
```

## DESCRIPTION
Lists the tasks on the LANDesk server and creates an object that can be piped to other functions.

## EXAMPLES

### -------------------------- EXAMPLE 1 --------------------------
```
Get-LANDeskTaskList
```

Outputs a list of all of the LANDesk scheduled tasks as an object.

### -------------------------- EXAMPLE 2 --------------------------
```
Get-LANDeskTaskList | Where {$_.FailedTargetCount -gt 0}
```

Returns a list of all scheduled tasks that have failed computers in them.

## PARAMETERS

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS

