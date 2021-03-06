﻿Function Get-ePoServerTaskList 
{
	<#	
		.SYNOPSIS
			Gets ePoServer Task information using the ePo API.
		
		.DESCRIPTION
			Sends the command specified to the McAfee EPO server. Connect-ePoServer has to be run first,
			as this function uses the epoServer global variable created by that functions connection to the server. Uses the Invoke-ePoCommand
		
			
		.EXAMPLE
			$ServerTaskList = Get-ePoServerTaskList
			
			Stores information about all of the Server tasks available on the ePo server.
			
        .NOTES
            Added logic to change true/false strings returned by API into boolean $True or $False values.
            Added logic to change date strings into DateTime objects.
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
        Write-Verbose "Running the API Command scheduler.listAllServerTasks"
        $results = Invoke-ePoCommand -Command "scheduler.listAllServerTasks"
        Write-verbose "Looping thru the results and creating a PowerShell object from that information."
		$Tasks = @()
        If($PSCmdlet.ShouldProcess("listAllServerTasks","Creating and outputting results of API command"))
        { 
            ForEach($Task in $results.result.list.serverTask)
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
                $Tasks += New-Object -TypeName PSObject -Property $props
		    }
		    $Tasks
        }
	}
	End{}
}