POSH-ePoAPI
==========

This is a PowerShell module for working with the LANDesk Console
Web based MBSDK.

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
