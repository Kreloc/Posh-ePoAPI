Function Get-ePoServerRunningTask
{
	<#	
		.SYNOPSIS
			Gets ePoServer Task information for running tasks using the ePo API.
		
		.DESCRIPTION
			Sends the command specified to the McAfee EPO server. Connect-ePoServer has to be run first,
			as this function uses the epoServer global variable created by that functions connection to the server. Uses the Invoke-ePoCommand
		
			
		.EXAMPLE
			$ServerTaskList = Get-ePoServerRunningTask
			
			Gets task information for running tasks on the ePoServer. Will be empty output if no running task is found.
			
        .NOTES
            Added support for Whatif

	#>
	[CmdletBinding(SupportsShouldProcess=$true)]
	param()
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
        Write-Verbose "Running the API Command scheduler.listRunningServerTasks"
        $results = Invoke-ePoCommand -Command "scheduler.listRunningServerTasks"
        Write-verbose "Looping thru the results and creating a PowerShell object from that information."
		$Tasks = @()
        If($PSCmdlet.ShouldProcess("listRunningServerTasks","Creating and outputting results of API command"))
        { 
            ForEach($Task in $results.result.list.serverTask)
		    {
                If($Task -notlike "")
                {
		            $props = @{TaskID = $Task.id
                               Name = $Task.name
                               Description = $Task.description
                               startDate = $StartDate
                               endDate = $EndDate
                               nextRunTime = $NextRunTime
                               Enabled = $Enabled
                               Valid = $Valid
		            }
                }
                $Tasks += New-Object -TypeName PSObject -Property $props
		    }
		    $Tasks
        }
	}
	End{}
}