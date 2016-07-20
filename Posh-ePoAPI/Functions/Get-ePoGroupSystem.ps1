Function Get-ePoGroupSystem
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
		
			Retruns the output of the epogroup.findSystems API command for computers under GroupId number 519.
			
		.EXAMPLE
			$FoundSystems = Get-ePoGroupSystem -GroupId "519" -Recurse
			
			Returns an object of the results of the systems in the Group with an ID of 519 including paths below the main one.

        .EXAMPLE
            $FoundSystems = Get-ePoGroup -Filter "Admin" | Get-ePoGroupSystem

            This example first gets the GroupID using Get-ePGroup with a Filter for the word Admin and then pipes that GroupID
            to find all of the computer systems under that group.

        .NOTES
            Logic added to get disk percent free space as property on object returned.
            Added support for GroupId parameter to take an array of strings
            Added support for Whatif
			
	#>
	[CmdletBinding(SupportsShouldProcess=$true)]
	param
	(
		[Parameter(Mandatory=$True,
		ValueFromPipeline=$True, ValueFromPipelinebyPropertyName=$true)]
		[string[]]$GroupID,
        [switch]$Recurse
	)
	Begin
    {
		If(!($epoServer))
		{
			Write-Warning "Connection to ePoServer not found. Please run Connect-ePoServer first."
			break
		}  
    }
	Process 
	{
        $FoundSystems = @()
        If(!($Recurse))
        {
            $SubSearch = "false"
        }
        else
        {
            $SubSearch = "true"
        }
        ForEach($id in $GroupID)
        {
		    $results = Invoke-ePoCommand -Command "epogroup.findSystems" -Parameters "groupId=$($id)&searchSubgroups=$($SubSearch)"
            If($PSCmdlet.ShouldProcess("$id","Creating output object for computer systems that belong to"))
            { 
                ForEach($Computer in $results.result.list.row)
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
		            $FoundSystems += New-Object -TypeName PSObject -Property $props
		        }
            }
        }
        If($PSCmdlet.ShouldProcess("epogroup.findSystems","Creating output object for computer systems found using command"))
        { 
		    $FoundSystems
        }
	}
	End{}
}