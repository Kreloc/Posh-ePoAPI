Function Start-ePoServerTask 
{
	<#	
		.SYNOPSIS
			Starts the specified server task.
		
		.DESCRIPTION
			Starts the specified server task. Requires the taskId of the servertask to run. Uses the
            scheduler.runServerTask api command.
		
		.PARAMETER TaskID
			The id number of the server task to run.
		
		.EXAMPLE
			Start-ePoServerTask -TaskID 26
			
			Starts the server task with an ID of 26. This is the AD Sync task in my environment.
			
		.EXAMPLE
			$RunServerTasks = Get-ePoServerTaskList | Where {$_.Name -match "DAT update"} | Start-ePoServerTask
            $RunServerTasks | Get-ePoTaskLogHistory
		
			First uses the Get-ePoServerTaskList function to find the server task(s) that have name(s) that match DAT update and then pipes the TaskId to 
            the Start-ePoServerTask function. The result object is stored in the variable $RunServerTasks.
            This variable is piped to Get-ePoTaskLogHistory, which uses the TaskID property of $RunServerTasks, to retrieve the TaskLog history for the server task(s)
            just run.
            
        .NOTES
            Added support for -Whatif
			
	#>
	[CmdletBinding(SupportsShouldProcess=$true)]
	param
	(
        [Parameter(Mandatory=$True,ValueFromPipeline=$True,
		ValueFromPipelinebyPropertyName=$true)]
		$TaskID        	
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
        Write-Verbose "Sending command scheduler.runServerTask to ePo API with parameters taskId=$($TaskID)"
        $results = Invoke-ePoCommand -Command "scheduler.runServerTask" -Parameters "taskId=$($TaskID)"
        $props = @{TaskID=$results.result
                    RunTaskID=$TaskID
                    }
        If($PSCmdlet.ShouldProcess("$TaskID","Outputting run result object"))
        {        
            New-Object -TypeName psobject -Property $props
        }
	}
	End{}
}