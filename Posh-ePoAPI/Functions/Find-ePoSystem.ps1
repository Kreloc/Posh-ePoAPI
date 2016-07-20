Function Find-ePoSystem 
{
	<#	
		.SYNOPSIS
			Finds a system using the ePo API.
		
		.DESCRIPTION
			Sends the command specified to the McAfee EPO server. Connect-ePoServer has to be run first,
			as this function uses the epoServer global variable created by that functions connection to the server. Uses the Invoke-ePoCommand
		
		.PARAMETER Filter
			The search string to use for finding a system. Defaults to a space, which returns all systems.
			
		.EXAMPLE
			$CurrentPC = Find-ePoSystem -Filter $env:computername
			$CurrentPC
		
			Retruns the output of the system.find API command with a search paramter for the current computer.
			
		.EXAMPLE
			$FoundSystems = Find-ePoSystem -Filter "lt"
			
			Returns an object of the results of the system.find search for systems with lt in their names.
        
        .EXAMPLE
            $AllSystems = Find-ePoSystem -Verbose
            
            Returns an object of the results of the system.find search for all systems.

        .NOTES
            Added logic to determine the Percent of disk space left on each system.
            TODO: Add support for Whatif
			
	#>
	[CmdletBinding(SupportsShouldProcess=$true)]
	param
	(
		[Parameter(Mandatory=$False,
		ValueFromPipeline=$True, ValueFromPipelinebyPropertyName=$true)]
		[string]$Filter = " "
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
        Write-Verbose "Sending system.find command to ePo API with parameter searchText=$($Filter)"
		$results = Invoke-ePoCommand -Command "system.find" -Parameters "searchText=$($Filter)"
        If($PSCmdlet.ShouldProcess("$Filter","Creating output object for system.find command results found using filter"))
        {   		
            $FoundSystems = @()
            ForEach($Computer in $results.result.list.row)
		    {
                Write-Verbose "Getting properties for $($Computer | Select -ExpandProperty EPOComputerProperties.ComputerName)"
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
		    $FoundSystems
        }
	}
	End{}
}