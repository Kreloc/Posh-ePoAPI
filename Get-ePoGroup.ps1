Function Get-ePoGroup 
{
	<#	
		.SYNOPSIS
			Gets ePoGroup information using the ePo API.
		
		.DESCRIPTION
			Sends the command specified to the McAfee EPO server. Connect-ePoServer has to be run first,
			as this function uses the epoServer global variable created by that functions connection to the server. Uses the Invoke-ePoCommand
		
		.PARAMETER Filter
			Search text, wildcards are not supported. Defaults to all groups.
			
		.EXAMPLE
			$ePoGroups = Get-ePoGroup
			$CurrentPC
		
			Retruns the output of the system.findGroups API command and stores the results in a variable.
			
		.EXAMPLE
			$FoundSystems = Get-ePoGroup -Filter "Admin"
			
			Returns an object of the results of the system.findGroups search for groups with Admin in their names.
			
		.NOTES
			Requires Connect-ePoServer to have been run first. All output is returned as a string currently, still looking
			into ways to convert it to an object.
			
	#>
	[CmdletBinding()]
	param
	(
		[Parameter(Mandatory=$False,
		ValueFromPipeline=$True, ValueFromPipelinebyPropertyName=$true)]
		[string]$Filter
	)
	Begin{}
	Process 
	{
        If($Filter)
        {
		    $results = Invoke-ePoCommand -Command "system.findGroups" -Parameters "searchText=$($Filter)"
        }
        else
        {
            $results = Invoke-ePoCommand -Command "system.findGroups"
        }
		$Groups = ForEach($Group in $results.result.list.element)
		{
       
		    $props = @{GroupName = ($Group.GroupEPO.GroupPath)
                        GroupID = ($Group.GroupEPO.GroupID)
		    }
		    New-Object -TypeName PSObject -Property $props
		}
		$Groups
	}
	End{}
}