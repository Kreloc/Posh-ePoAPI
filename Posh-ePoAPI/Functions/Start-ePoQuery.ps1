Function Start-ePoQuery
{
    <#	
	.SYNOPSIS
		Runs a query using the ePo API.
		
	.DESCRIPTION
		Sends the command specified to the McAfee EPO server. Connect-ePoServer has to be run first,
		as this function uses the epoServer global variable created by that functions connection to the server. Uses the Invoke-ePoCommand
		
	.PARAMETER QueryId
		The ID number of the query to be run.
			
	.EXAMPLE
		$ePoQueries = Get-ePoQuery
		$QueryResults = $ePoQueries | Where {$_.Description -like "*unmanaged*"} | Start-ePoQuery
        $QueryResults
		
		Retruns the output of the core.listQueries API command and stores the PowerShell custom object in a variable $ePoQueries.
        This is then piped to where-object to find queries with a description with unmanged in it.
        This in then piped in turn to the Start-ePoQuery and the results are stored in a variable.
			
			
	#>
	[CmdletBinding(SupportsShouldProcess=$true)]
	param
	(
        [Parameter(Mandatory=$True,
		ValueFromPipeline=$True,ValueFromPipelinebyPropertyName=$true)]
		$QueryId        
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
       $results = Invoke-ePOCommand -Command "core.executeQuery" -Parameters "queryId=$($QueryId)"
        If($PSCmdlet.ShouldProcess("$QueryId","Outputting results of query run"))
        {       
           ForEach($result in $results.result.list.row )
           {
                $result
           }
        }
    }
    End{}
}