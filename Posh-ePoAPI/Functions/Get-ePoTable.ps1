Function Get-ePoTable 
{
	<#	
		.SYNOPSIS
			Gets table information using the ePo API.
		
		.DESCRIPTION
			Sends the command specified to the McAfee EPO server. Connect-ePoServer has to be run first,
			as this function uses the epoServer global variable created by that functions connection to the server. Uses the Invoke-ePoCommand
		
		.PARAMETER TableName
			The database type-qualified name of the table to which view the details. Defaults to all tables.
			
		.EXAMPLE
			$ePoTables = Get-ePoTable
			$ePoTables
		
			Retruns the output of the core.listTables API command and stores the PowerShell custom object in a variable.
			
		.EXAMPLE
			$FoundTable = Get-ePoTable -TableName "MyTable"
			
			Returns an object of the results of the core.listTables API command with a table name of MyTable.

        .NOTES
            Added support for an array of strings for the TableName parameter
            Added support for -Whatif
			
	#>
	[CmdletBinding(SupportsShouldProcess=$true)]
	param
	(
		[Parameter(Mandatory=$False,
		ValueFromPipeline=$True, ValueFromPipelinebyPropertyName=$true)]
        [AllowEmptyString()]
		[string[]]$TableName = ""
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
        $Tables = @()
        ForEach($TableNameItem in $TableName)
        {
            If($TableNameItem -notlike "")
            {
		        $results = Invoke-ePoCommand -Command "core.listTables" -Parameters "table=$($TableNameItem)"
            }
            else
            {
                $results = Invoke-ePoCommand -Command "core.listTables"
            }
            If($PSCmdlet.ShouldProcess("$TableNameItem","Creating output object of table information for"))
            {
		        ForEach($Table in $results.result.list.table)
		        {
       
		            $props = @{TableName = ($Table | Select -ExpandProperty name)
                            Target = ($Table |  Select -ExpandProperty target)
                            DatabaseType = ($Table | Select -ExpandProperty databaseType)
                            Description = ($Table | Select -ExpandProperty description)
                            Columns = ($Table | Select -ExpandProperty columns)
                            RelatedTables = ($Table | Select -ExpandProperty relatedTables)
                            ForeignKeys = ($Table | Select -ExpandProperty foreignKeys)

		            }
		            $Tables += New-Object -TypeName PSObject -Property $props
		        }
            }
        }
        If($PSCmdlet.ShouldProcess("$TableNameItem","Ouputting object of table information for"))
        {
            $Tables
        }
	}
	End{}
}