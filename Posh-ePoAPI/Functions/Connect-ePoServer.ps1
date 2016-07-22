Function Connect-ePoServer 
{
	<#	
		.SYNOPSIS
			The Connect-ePoServer function establishes a connection the McAfee EPO Server.
		
		.DESCRIPTION
			The Connect-ePoServer function establishes a connection the McAfee EPO Server. All results are returned in XML
			format. The System.Net below is to bypass unstrusted https, since by default ePo server self signs its cert. Lists all
			of the commands available after a successful connection has been made.
		
		.PARAMETER ePOServer
			The url used to access the McAfee EPO.

		.EXAMPLE
			Connect-ePoServer
			
			Connects to the default McAfee EPO Server.
			
		.EXAMPLE
			Connect-ePoServer -ePOServer "https://yourserver:8443"
			
			Connects to the McAfee EPO Server at https://yourserver:8443

        .EXAMPLE
            Connect-ePoServer -ePoServer -ePOServer "https://yourserver"
            $ePoCommands | Where {$_.Command -like "*system*"} | Get-ePoCommandHelp

            This makes an active connection to the server. It then gets the command help for all of the commands that have the word system in it.
			
		.NOTES
			This function currently creates three script scope variables. 
            The variable names are: Credentials, ePOServer, and ePoCommands. ePOServer is the url of the McAfee EPO Server. ePoCommands is a custom PowerShell object with the Command and CommandText for each
            command found using the core.help API command. The Credentials variable is used for subsequent calls to the McAfee ePo API.
            Added logic to check that the connection to the ePoServer works.
            Changed to use Invoke-RestMethod as previous WebClient method was not securing password.
            Module requires PowerShell verison 3 or higher.			

	#>
	[CmdletBinding()]
	param
	(
		[Parameter(Mandatory=$True,
		ValueFromPipeline=$True, ValueFromPipelinebyPropertyName=$true)]
		[string]$ePOServer,
        [Parameter(Mandatory=$False,
        ValueFromPipelinebyPropertyName=$true)]
        $script:Credentials = (Get-Credential)
	)
	Begin{}
	Process 
	{
		$url = "$($epoServer)/remote/core.help?:output=xml"
        Try
        {
		    $ePoCommandResult = [xml]((Invoke-RestMethod -Uri $Url -Credential $Credentials) -replace "OK:`r`n")
        }
        Catch
        {
            Write-Error $_
            Write-Warning "There was an error connecting to the server at $($ePoServer)"
            $ePOServer = $null
            $wc = $null
        }
        $script:ePoCommands = ForEach($Command in $ePoCommandResult.result.list.element)
        {
            $CommandName = ($Command -split ' ')[0]
            $CommandUse = $Command -replace ".*-"
            $props = @{Command=$CommandName
              CommandText=$CommandUse
              }
            New-Object -TypeName PSObject -Property $props
        }
	}
	End{}
}