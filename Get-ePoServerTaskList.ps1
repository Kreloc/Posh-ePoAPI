Function Get-ePoServerTaskList 
{
	<#	
		.SYNOPSIS
			Gets ePoServer Task information using the ePo API.
		
		.DESCRIPTION
			Sends the command specified to the McAfee EPO server. Connect-ePoServer has to be run first,
			as this function uses the epoServer global variable created by that functions connection to the server. Uses the Invoke-ePoCommand
		
			
		.EXAMPLE
			$ServerTaskList = Get-ePoServerTaskList
			
			Returns an object of the results of the system.findGroups search for groups with Admin in their names.
			
		.NOTES
			Requires Connect-ePoServer to have been run first. All output is returned as a string currently, still looking
			into ways to convert it to an object.
			
	#>
	[CmdletBinding()]
	param()
	Begin{}
	Process 
	{
        Write-Verbose "Running the API Command scheduler.listAllServerTasks"
        $results = Invoke-ePoCommand -Command "scheduler.listAllServerTasks"
        Write-verbose "Looping thru the results and creating a PowerShell object from that information."
		$Tasks = ForEach($Task in $results.result.list.serverTask)
		{
            If($task.startDate -notlike "None")
            {
                $StartDate = Get-Date ($Task.startDate)
            }
            else
            {
                $StartDate = $Task.startDate
            }
            If($task.endDate -notlike "None")
            {
                $EndDate = Get-Date ($Task.endDate)
            }
            else
            {
                $EndDate = $Task.endDate
            }
            If($task.nextRunTime -notlike "None")
            {
                $NextRunTime = Get-Date ($Task.nextRunTime)
            }
            else
            {
                $NextRunTime = $Task.nextRunTime
            }
            If($task.enabled -eq "false")
            {
                $Enabled = $False
            }
            elseIf($task.enabled -eq "true")
            {
                $Enabled = $True
            }
            else
            {
                $Enabled = $Task.enabled
            }
            If($task.valid -eq "false")
            {
                $Valid = $False
            }
            elseIf($task.valid -eq "true")
            {
                $Valid = $True
            }
            else
            {
                $Valid = $task.valid
            }
		    $props = @{TaskID = $Task.id
                       Name = $Task.name
                       Description = $Task.description
                       startDate = $StartDate
                       endDate = $EndDate
                       nextRunTime = $NextRunTime
                       Enabled = $Enabled
                       Valid = $Valid
		    }
		    New-Object -TypeName PSObject -Property $props
		}
		$Tasks
	}
	End{}
}