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
			
	#>
	[CmdletBinding()]
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
	Begin{}
	Process 
	{
        $results = Invoke-ePoCommand -Command "clienttask.run" -Parameters "names=$($ComputerName)&productId=$($ProductId)&taskId=$($TaskId)"
        $props = @{ResultStatus=$results.result
                    ComputerName=$ComputerName
                    }
        New-Object -TypeName psobject -Property $props
	}
	End{}
}