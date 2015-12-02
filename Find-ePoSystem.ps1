Function Find-ePoSystem 
{
	<#	
		.SYNOPSIS
			Finds a system using the ePo API.
		
		.DESCRIPTION
			Sends the command specified to the McAfee EPO server. Connect-ePoServer has to be run first,
			as this function uses the epoServer global variable created by that functions connection to the server. Uses the Invoke-ePoCommand
		
		.PARAMETER Filter
			The search string to use for finding a system.
			
		.EXAMPLE
			$CurrentPC = Find-ePoSystem -Filter $env:computername
			$CurrentPC
		
			Retruns the output of the system.find API command with a search paramter for the current computer.
			
		.EXAMPLE
			$FoundSystems = Find-ePoSystem -Filter "lt"
			
			Returns an object of the results of the system.find search for systems with lt in their names.
			
		.NOTES
			Requires Connect-ePoServer to have been run first. All output is returned as a string currently, still looking
			into ways to convert it to an object.
			
	#>
	[CmdletBinding()]
	param
	(
		[Parameter(Mandatory=$True,
		ValueFromPipeline=$True, ValueFromPipelinebyPropertyName=$true)]
		[string]$Filter
	)
	Begin{}
	Process 
	{
		$results = Invoke-ePoCommand -Command "system.find" -Parameters "searchText=$($Filter)"
		$FoundSystems = ForEach($Computer in $results.result.list.row)
		{
		$props = @{ComputerName = ($Computer | Select -ExpandProperty EPOComputerProperties.ComputerName)
					ADDescription = ($Computer | Select -ExpandProperty EPOComputerProperties.Description)
					SystemDescription = ($Computer | Select -ExpandProperty EPOComputerProperties.SystemDescription)
					UserName = ($Computer | Select -ExpandProperty EPOComputerProperties.UserName)
					TotalPhysicalMemory = ($Computer | Select -ExpandProperty EPOComputerProperties.TotalPhysicalMemory)
					FreeMemory = ($Computer | Select -ExpandProperty EPOComputerProperties.FreeMemory)
					FreeDiskSpace = ($Computer | Select -ExpandProperty EPOComputerProperties.FreeDiskSpace)
					TotalDiskSpace = ($Computer | Select -ExpandProperty EPOComputerProperties.TotalDiskSpace)
					Tags = ($Computer | Select -ExpandProperty EPOLeafNode.Tags)
					LastUpdate = ($Computer | Select -ExpandProperty EPOLeafNode.LastUpdate)
					AgentVersion = ($Computer | Select -ExpandProperty EPOLeafNode.AgentVersion)
					AgentGUID = ($Computer | Select -ExpandProperty EPOLeafNode.AgentGUID)
		}
		New-Object -TypeName PSObject -Property $props
		}
		$FoundSystems
	}
	End{}
}