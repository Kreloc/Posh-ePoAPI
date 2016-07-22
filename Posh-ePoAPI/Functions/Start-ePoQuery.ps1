Function Start-ePoQuery
{
    <#	
	.SYNOPSIS
		Runs a query using the ePo API.
		
	.DESCRIPTION
		Sends the command specified to the McAfee EPO server. Connect-ePoServer has to be run first,
		as this function uses the epoServer global variable created by that functions connection to the server. Uses the Invoke-ePoCommand function.
		
	.PARAMETER QueryId
		The ID number of the query to be run.
			
	.EXAMPLE
        Start-ePoQuery -QueryName "Duplicate Systems Names" -Verbose

        Returns the output of the query named Duplicate Systems Name

    .EXAMPLE
		$ePoQueries = Get-ePoQuery
		$QueryResults = $ePoQueries | Where {$_.Description -like "*unmanaged*"} | Start-ePoQuery
        $QueryResults
		
		Retruns the output of the core.listQueries API command and stores the PowerShell custom object in a variable $ePoQueries.
        This is then piped to where-object to find queries with a description with unmanged in it.
        This in then piped in turn to the Start-ePoQuery and the results are stored in a variable.

    .NOTES
        Added support for Whatif
        Added logic that gets all queries so a QueryName parameter can be used instead of only the QueryId parameter.
        TODO: Determine if I should change the name of this function and incorporate Get-ePoQuery into it as a parameter.
			
			
	#>
	[CmdletBinding(SupportsShouldProcess=$true)]
	param
	(
        [Parameter(Mandatory=$True, ParameterSetName='QueryID',
		ValueFromPipeline=$True,ValueFromPipelinebyPropertyName=$true)]
		$QueryId,
        [Parameter(Mandatory=$True, ParameterSetName='QueryName',
		ValueFromPipeline=$True,ValueFromPipelinebyPropertyName=$true)]
		$QueryName          
    )
	Begin
    {
		If(!($epoServer))
		{
			Write-Warning "Connection to ePoServer not found. Please run Connect-ePoServer first."
			break
		} 
        #Used to check that the query exists
        $Queries = Get-ePoQuery
        $QueryID 
    }
    Process
    {
        If($QueryId)
        {
            $QueryId = $Queries | Where {$_.QueryId -eq $QueryId} | Select -ExpandProperty QueryId
        }
        If($QueryName)
        {
            $QueryId = $Queries | Where {$_.Name -eq $QueryName} | Select -ExpandProperty QueryId                  
        }
        If($QueryId)
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
        else
        {
            Write-Warning "Did not find specified query, please check name or id used"
        }
    }
    End{}
}