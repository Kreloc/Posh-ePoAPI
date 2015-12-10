﻿Function Get-ePoGroupSystem
{
	<#	
		.SYNOPSIS
			Finds a system or systems in an ePoGroup using the ePo API.
		
		.DESCRIPTION
			Sends the command specified to the McAfee EPO server. Connect-ePoServer has to be run first,
			as this function uses the epoServer global variable created by that functions connection to the server. Uses the Invoke-ePoCommand
		
		.PARAMETER GroupId
			The Id of the group to search within. Id number can be obtained by using Get-ePoGroup

        .PARAMETER Recurse
            A switch to search subgroups as well. Defaults to false. True needs to be inputted in lowercase like 'true'
            The case sensitivity is part of the ePo API.			

		.EXAMPLE
			$GroupPCs = Get-ePoGroupSystem -GroupId "519"
			$CurrentPC
		
			Retruns the output of the system.find API command with a search paramter for the current computer.
			
		.EXAMPLE
			$FoundSystems = Get-ePoGroupSystem -GroupId "519" -Recurse
			
			Returns an object of the results of the system.find search for systems with lt in their names.

        .EXAMPLE
            $FoundSystems = Get-ePoGroup -Filter "Admin" | Get-ePoGroupSystem

            This example first gets the GroupID using Get-ePGroup with a Filter for the word Admin and then pipes that GroupID
            to find all of the computer systems under that group.
			
		.NOTES
			Requires Connect-ePoServer to have been run first. All output is returned as a string currently, still looking
			into ways to convert it to an object.
			
	#>
	[CmdletBinding()]
	param
	(
		[Parameter(Mandatory=$True,
		ValueFromPipeline=$True, ValueFromPipelinebyPropertyName=$true)]
		[string]$GroupID,
        [switch]$Recurse
	)
	Begin{}
	Process 
	{
        If(!($Recurse))
        {
            $SubSearch = "false"
        }
        else
        {
            $SubSearch = "true"
        }
		$results = Invoke-ePoCommand -Command "epogroup.findSystems" -Parameters "groupId=$($GroupID)&searchSubgroups=$($SubSearch)"
		$FoundSystems = ForEach($Computer in $results.result.list.row)
		{
        $TotalSpace = $Computer | Select -ExpandProperty EPOComputerProperties.TotalDiskSpace
        If($TotalSpace -ne 0)
        {
            $PercentDiskSpaceFree = ([MATH]::Round(($Computer | Select -ExpandProperty EPOComputerProperties.FreeDiskSpace) / ($Computer | Select -ExpandProperty EPOComputerProperties.TotalDiskSpace), 3)) * 100
		}
        else
        {
            $PercentDiskSpaceFree = 0
        }
		$props = @{ComputerName = ($Computer | Select -ExpandProperty EPOComputerProperties.ComputerName)
					ADDescription = ($Computer | Select -ExpandProperty EPOComputerProperties.Description)
					SystemDescription = ($Computer | Select -ExpandProperty EPOComputerProperties.SystemDescription)
					UserName = ($Computer | Select -ExpandProperty EPOComputerProperties.UserName)
					TotalPhysicalMemory = ($Computer | Select -ExpandProperty EPOComputerProperties.TotalPhysicalMemory)
					FreeMemory = ($Computer | Select -ExpandProperty EPOComputerProperties.FreeMemory)
					FreeDiskSpace = ($Computer | Select -ExpandProperty EPOComputerProperties.FreeDiskSpace)
					TotalDiskSpace = ($Computer | Select -ExpandProperty EPOComputerProperties.TotalDiskSpace)
                    PercentDiskSpaceFree = $PercentDiskSpaceFree
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