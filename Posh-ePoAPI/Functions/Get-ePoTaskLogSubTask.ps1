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
            Added support for an array of integers being passed to the taskId parameter.
            Added custom error handling. Uses Write-Warning to display the Error if the taskID does not exists but should continue to the next one if another is specified.
            Added support for Whatif	
			
	#>
	[CmdletBinding(SupportsShouldProcess=$true)]
	param
	(
		[Parameter(Mandatory=$True,
		ValueFromPipeline=$True, ValueFromPipelinebyPropertyName=$true)]
		[int[]]$taskId	
	)
	Begin
    {
		If(!($epoServer))
		{
			Write-Warning "Connection to ePoServer not found. Please run Connect-ePoServer first."
			break
		}
        $BeginEA = $ErrorActionPreference
        $ErrorActionPreference = "Stop"
    }
	Process 
	{
        $TaskInformation = @()
        ForEach($id in $taskId)
        {
            Try
            {
                $results = Invoke-ePoCommand -Command "tasklog.listSubtasks" -Parameters "taskLogId=$($id)"
            }
            Catch
            {
                Write-Warning "An error occured running this command. Most likely cause is the task with $($id) is no longer running."
                Write-Warning $_
                Continue
            }
            If($PSCmdlet.ShouldProcess("$id","Creating output object for subtasks of task"))
            {
                ForEach($result in $results.result.list.subtask)
                {
                    $props=@{ComputerName=($result -replace "Computer Name: ")
                            userName=$result.userName
                            taskId=$taskId                    
                    }
                    $TakskInformation += New-Object -TypeName psobject -Property $props
                }
            }
        }
        If($PSCmdlet.ShouldProcess("$id","Outputting subtasks for task"))
        {
            $TaskInformation
        }
    }
	End
    {
        $ErrorActionPreference = $BeginEA
    }
}