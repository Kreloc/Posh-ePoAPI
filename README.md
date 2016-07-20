POSH-ePoAPI
==========

This is a PowerShell module for working with the McAfee ePo server API.

#Instructions

```powershell
# One time setup
    # Download the repository
    # Unblock the zip
    # Extract the POSH-ePoAPI folder to a module path (e.g. $env:USERPROFILE\Documents\WindowsPowerShell\Modules\)

    #Simple alternative, if you have PowerShell 5, or the PowerShellGet module:
        Install-Module POSH-ePoAPI

# Import the module.
    Import-Module POSH-ePoAPI    #Alternatively, Import-Module \\Path\To\POSH-ePoAPI

# Get commands in the module
    Get-Command -Module POSH-ePoAPI

# Get help
    Get-Help Connect-ePoServer -Full
```

#Examples

###Connect to McAfee ePo server


```PowerShell
# Connects to ePo server in your environment (will prompt for credentials)
	Connect-ePoServer -ePOServer "https://yourserver"
```

###List all computers
```PowerShell
#Gets all of the computers available from the LANDesk server
	Find-ePoSystem

#Gets computer that matches filter
	Get-ePoSystem -Filter "Pre-"
		
	Returns all McAfee ePo computers that have a computername beginning with Pre-

```

ChangeLog
=========
Created module and functions for various McAfee ePo API commands.
Added support for -WhatIf to all functions, except Connect-ePoServer.
Added a check for good connection to Connect-ePoServer.

TODO:
Add function for adding a user using core.addUser command.
Add function for removing a user using core.removeUser command.
Add function to synchorinze Domains and AD with the system tree using epo.syncDirectory command.
Look into policy commands and determine what functions to create.
Look into repository commands and determine what functions to create.
Look into scheduler commands and determine what functions to create.
Add function to tag computers using the system.applyTag command.
Add function to remove tags from compuers using the system.clearTag command.
Look into system commands and determine what functions to create.

