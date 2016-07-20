Function Start-ePoClientTask 
{
	<#	
		.SYNOPSIS
			Starts the specified client task on specified target system.
		
		.DESCRIPTION
			Starts the specified client task on specified target system. Requires the productId and taskId of the clienttask to run. Uses the
            clienttask.run api command.
		
		.PARAMETER ComputerName
			The name of the computer to start the client task on.
		
		.EXAMPLE
			Start-ePoClientTask -ComputerName "THATPC" -ProductId "VIRUSCAN8800" -TaskId "111"
			
			Starts a client task for a Full Scan - Normal priority on the computer named "THATPC"
			
		.EXAMPLE
			Get-ePoClientTask -Filter "Full scan - Normal Priority" | Start-ePoClientTask -ComputerName "THATPC"
		
			First uses the Get-ePoClientTask function to find the correct client task and then pipes the TaskId and ProductId to 
            the Start-ePoClientTask function.
            
        .NOTES
            Added support for -Whatif
            TODO: Implement script wrapping this to start a virus scan on client as soon as Malware alert is triggered.
			
	#>
	[CmdletBinding(SupportsShouldProcess=$true)]
	param
	(
		[Parameter(Mandatory=$True,
		ValueFromPipeline=$True, ValueFromPipelinebyPropertyName=$true)]
		[string]$ComputerName,
        [Parameter(Mandatory=$True,
		ValueFromPipelinebyPropertyName=$true)]
		$TaskId,
        [Parameter(Mandatory=$True,
		ValueFromPipelinebyPropertyName=$true)]
		$ProductId
        	
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
        Write-Verbose "Sending command clienttask.run to ePo API with parameters names=$($ComputerName)&productId=$($ProductId)&taskId=$($TaskId)"
        $results = Invoke-ePoCommand -Command "clienttask.run" -Parameters "names=$($ComputerName)&productId=$($ProductId)&taskId=$($TaskId)"
        $props = @{ResultStatus=$results.result
                    ComputerName=$ComputerName
                    }
        If($PSCmdlet.ShouldProcess("$ComputerName","Outputting run result object"))
        {        
            New-Object -TypeName psobject -Property $props
        }
	}
	End{}
}