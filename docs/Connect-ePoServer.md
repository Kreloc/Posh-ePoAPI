---
external help file: Posh-ePoAPI-help.xml
online version: 
schema: 2.0.0
---

# Connect-ePoServer
## SYNOPSIS
The Connect-ePoServer function establishes a connection the McAfee EPO Server.

## SYNTAX

```
Connect-ePoServer [-script:ePOServer] <String> [[-script:Credentials] <Object>]
```

## DESCRIPTION
The Connect-ePoServer function establishes a connection the McAfee EPO Server.
All results are returned in XML
format.
The System.Net below is to bypass unstrusted https, since by default ePo server self signs its cert.
Lists all
of the commands available after a successful connection has been made.

## EXAMPLES

### -------------------------- EXAMPLE 1 --------------------------
```
Connect-ePoServer
```

Connects to the default McAfee EPO Server.

### -------------------------- EXAMPLE 2 --------------------------
```
Connect-ePoServer -ePOServer "https://yourserver:8443"
```

Connects to the McAfee EPO Server at https://yourserver:8443

### -------------------------- EXAMPLE 3 --------------------------
```
Connect-ePoServer -ePoServer -ePOServer "https://yourserver"


$ePoCommands | Where {$_.Command -like "*system*"} | Get-ePoCommandHelp

```
This makes an active connection to the server.
It then gets the command help for all of the commands that have the word system in it.

## PARAMETERS

### -script:ePOServer
{{Fill script:ePOServer Description}}

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

### -script:Credentials
{{Fill script:Credentials Description}}

```yaml
Type: Object
Parameter Sets: (All)
Aliases: 

Required: False
Position: 2
Default value: (Get-Credential)
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

## INPUTS

## OUTPUTS

## NOTES
This function currently creates three script scope variables. 
         The variable names are: Credentials, ePOServer, and ePoCommands.
ePOServer is the url of the McAfee EPO Server.
ePoCommands is a custom PowerShell object with the Command and CommandText for each
         command found using the core.help API command.
The Credentials variable is used for subsequent calls to the McAfee ePo API.
         Added logic to check that the connection to the ePoServer works.
         Changed to use Invoke-RestMethod as previous WebClient method was not securing password.
         Module requires PowerShell verison 3 or higher.

## RELATED LINKS

