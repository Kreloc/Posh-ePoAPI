Function Invoke-ePOCommand 
{
	<#	
		.SYNOPSIS
			Sends the command specified to the McAfee EPO server.
		
		.DESCRIPTION
			Sends the command specified to the McAfee EPO server. Connect-ePoServer has to be run first,
			as this function uses the epoServer global variable created by that functions connection to the server.
            This function is the main piece of the entire POSH-ePoAPI module.
		
		.PARAMETER Command
			The command to send to the McAfee EPO API.
			
		.EXAMPLE
			$CurrentPC = Invoke-ePOCommand -Command "system.find" -Parameters "searchText=$($env:computername)"
			$CurrentPC.result.list.row
		
			Retruns the output of the system.find API command with a search paramter for the current computer.

			
	#>
	[CmdletBinding(SupportsShouldProcess=$true)]
	param
	(
		[Parameter(Mandatory=$True,
		ValueFromPipeline=$True, ValueFromPipelinebyPropertyName=$true)]
		[string]$Command,
		[string[]]$Parameters	
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
		If(!($Parameters))
		{
            If($PSCmdlet.ShouldProcess("$Command","Sending command to McAfee ePo API"))
            {            
			    $url = "$($epoServer)/remote/$($Command)?&:output=xml"
            }
		}
		else
		{
            If($PSCmdlet.ShouldProcess("$Command","Sending command with $($Parameters) to McAfee ePo API"))
            {   
			    $url = "$($epoServer)/remote/$($Command)?$($Parameters)&:output=xml"
            }
		}
		[xml](($wc.DownloadString($url)) -replace "OK:`r`n")
	}
	End{}
}