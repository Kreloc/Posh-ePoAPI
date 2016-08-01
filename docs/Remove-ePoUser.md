---
external help file: Posh-ePoAPI-help.xml
online version: https://github.com/Kreloc
schema: 2.0.0
---

# Remove-ePoUser
## SYNOPSIS
Removes a user from ePo API.

## SYNTAX

### ID
```
Remove-ePoUser -UserID <String> [-WhatIf] [-Confirm]
```

### Name
```
Remove-ePoUser -UserName <String> [-WhatIf] [-Confirm]
```

## DESCRIPTION
Removes the specifed user from ePo API using the core.removeUser API command.
Needs either the Unique ID or Name
         of the user to remove

## EXAMPLES

### -------------------------- EXAMPLE 1 --------------------------
```
Remove-ePoUser -UserName "network"
```

Removes the user with the unique username network

### -------------------------- EXAMPLE 2 --------------------------
```
$UserID = Get-ePoUser | Where {$_.FullName -like "Mark*"} | Remove-ePoUser
```

Gets the users that have Full Names like Mark* and pipes them to Remove-ePoUser, using the UserID property of the Get-ePoUser function.
         This will remove each user account with a full name beginning with Mark.

## PARAMETERS

### -UserID
{{Fill UserID Description}}

```yaml
Type: String
Parameter Sets: ID
Aliases: 

Required: True
Position: Named
Default value: 
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### -UserName
{{Fill UserName Description}}

```yaml
Type: String
Parameter Sets: Name
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
Removes user using the core.removeUser API Command.
Requires Global Administrator privilege on ePoServer.

## RELATED LINKS

[https://github.com/Kreloc](https://github.com/Kreloc)

