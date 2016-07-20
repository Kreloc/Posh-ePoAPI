Function Get-ePoTaskLogHistory 
{
	<#	
		.SYNOPSIS
			Gets the task log history from the McAfee server.
		
		.DESCRIPTION
			Gets the task log history from the McAfee server. Uses the tasklog.listTaskHistory api command.
            This function is still a Work in Progress.
		
		.PARAMETER taskId
			The Id of the task to search the logs for.
			
        .PARAMETER maxRows
            The maximum number of rows to return.

        .PARAMETER age
            The age of the logs to search for.

        .PARAMETER unit
            The unit of measurement for the age parameter
		
		.EXAMPLE
			Get-ePoTaskLogHistory
			
			Gets the ePoTask log history from the McAfee server.
			

		.NOTES
            This function is still a work in progress.
			Parameters are still a work in progress for this function. Please only use it without the parameters.
            Added support for Whatif
            TODO: Add support for other parameters.		
			
	#>
	[CmdletBinding(SupportsShouldProcess=$true)]
	param
	(
		[Parameter(Mandatory=$False,
		ValueFromPipeline=$True, ValueFromPipelinebyPropertyName=$true)]
		$taskId,
        [Parameter(Mandatory=$False,
		ValueFromPipelinebyPropertyName=$true)]
		$maxRows,
        [Parameter(Mandatory=$False,
		ValueFromPipelinebyPropertyName=$true)]
		$age,
        [Parameter(Mandatory=$False,
		ValueFromPipelinebyPropertyName=$true)]
		$unit
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
        If($taskId -and $maxRows -and $age -and $unit)
        {
            $results = Invoke-ePoCommand -Command "tasklog.listTaskHistory" -Parameters "taskId=$($taskId)&maxRows=$($maxRows)&age=$($age)&unit=$($unit)"
        }
        ElseIf($taskId)
        {
            $results = Invoke-ePoCommand -Command "tasklog.listTaskHistory" -Parameters "taskId=$($taskId)"
        }
        ElseIf($maxRows -and $age -and $unit)
        {
            $results = Invoke-ePoCommand -Command "tasklog.listTaskHistory" -Parameters "maxRows=$($maxRows)&age=$($age)&unit=$($unit)"
        }
        ElseIf($maxRows -and $age)
        {
            $results = Invoke-ePoCommand -Command "tasklog.listTaskHistory" -Parameters "maxRows=$($maxRows)&age=$($age)"
        }
        ElseIf($maxRows -and $unit)
        {
            $results = Invoke-ePoCommand -Command "tasklog.listTaskHistory" -Parameters "maxRows=$($maxRows)&unit=$($unit)"
        }
        ElseIf($age -and $unit)
        {
            $results = Invoke-ePoCommand -Command "tasklog.listTaskHistory" -Parameters "age=$($age)&unit=$($unit)"
        }
        else
        {
            $results = Invoke-ePoCommand -Command "tasklog.listTaskHistory"    
        }
        If($PSCmdlet.ShouldProcess("listTaskHistory","Creating output from results of "))
        {  
            $TaskLogHistory = @()
            ForEach($result in $results.result.list.taskLogEntry)
            {
                $props = @{taskLogId=$result.id
                            TaskName=$result.name
                            startDate=(Get-Date ($result.startDate))
                            endDate=(Get-Date ($result.endDate))
                            UserStartedTask=$result.userName
                            taskSource=$result.taskSource
                            taskDuration=$result.duration         
                }
               $TaskLogHistory += New-Object -TypeName psobject -Property $props
            }
            $TaskLogHistory
        }
	}
	End{}
}