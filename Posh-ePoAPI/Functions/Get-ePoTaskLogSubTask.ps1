Function Get-ePoTaskLogSubTask
{
	<#	
		.SYNOPSIS
			The Get-ePoTaskLogSubTask gets information about the taskID specified.
		
		.DESCRIPTION
			The Get-ePoTaskLogSubTask gets information about the taskID specified. Needs Connect-ePoServer to have been run
            and uses the Invoke-ePoCommand function.
		
		.PARAMETER taskId
			The ID number of the task to find information about.
		
		.EXAMPLE
			Get-ePoTaskLogSubTask -taskId 111
			
			Gets information about the task with an Id of 111.

		.NOTES
			This function is still a work in progress.			
			
	#>
	[CmdletBinding()]
	param
	(
		[Parameter(Mandatory=$True,
		ValueFromPipeline=$True, ValueFromPipelinebyPropertyName=$true)]
		[int]$taskId	
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
        $results = Invoke-ePoCommand -Command "tasklog.listSubtasks" -Parameters "taskLogId=$($taskId)"
        $TaskInformation = 
        ForEach($result in $results.result.list.subtask)
        {
            $props=@{ComputerName=($result -replace "Computer Name: ")
                    userName=$result.userName
                    taskId=$taskId

                    
            }
        }
        $TaskInformation
	}
	End{}
}