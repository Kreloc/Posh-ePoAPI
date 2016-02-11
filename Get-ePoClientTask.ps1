Function Get-ePoClientTask 
{
	<#	
		.SYNOPSIS
			Gets client task information based on filter parameter.
		
		.DESCRIPTION
			Gets client task information based on filter parameter. Uses the clienttask.find api command
		
		.PARAMETER Filter
			The search string to use for finding the client task.
		
		.EXAMPLE
			Get-ePoClientTask -Filter "Full scan - Normal Priority"
			
			Returns information about the client task with Full scan - Normal Priority in the task name.
			
		.EXAMPLE
			Get-ePoClientTask -Filter "scan"
		
			Returns information about client tasks with scan in the task name.

        .EXAMPLE
            $UpdateClientTasks = Get-ePoClientTask -Filter "update"
            $DatUpdateTask = $UpdateClientTasks | Where {$_.TaskName -like "DAT Update"}

            $DatUpdateTask | Start-ePoClientTask -ComputerName "NEEDSDAT-UPDT"

            First gets information about clients tasks with update in the task name and stores it in a variable.
            Then filters that variable to Where-Object, for tasks with a name like DAT Update and stores it in a variable.
            Finally, it pipes that variable to Start-ePoClientTask, starting the Dat update client task on the computer named NEEDSDAT-UPDT.
			
	#>
	[CmdletBinding()]
	param
	(
		[Parameter(Mandatory=$True,
		ValueFromPipeline=$True, ValueFromPipelinebyPropertyName=$true)]
		[string]$Filter
	)
	Begin{}
	Process 
	{
		$results = Invoke-ePoCommand -Command "clienttask.find" -Parameters "searchText=$($Filter)"
        $ClientTasks = ForEach($result in $results.result.list.element.objectTask)
        {
            $props = @{TaskId=$result.objectId
                       TaskName=$result.objectName
                       ProductId=$result.productId
                       typeId=$result.typeId
                       typeName=$result.typeName
            }
        New-Object -TypeName psobject -Property $props
        }
        $ClientTasks
	}
	End{}
}