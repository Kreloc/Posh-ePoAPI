Function Invoke-ePOCommand 
{
	<#	
		.SYNOPSIS
			Sends the command specified to the McAfee EPO server.
		
		.DESCRIPTION
			Sends the command specified to the McAfee EPO server. Connect-ePoServer has to be run first,
			as this function uses the epoServer global variable created by that functions connection to the server.
		
		.PARAMETER Command
			The command to send to the McAfee EPO API.
			
		.EXAMPLE
			$CurrentPC = Invoke-ePOCommand -Command "system.find" -Parameters "searchText=$($env:computername)"
			$CurrentPC.result.list.row
		
			Retruns the output of the system.find API command with a search paramter for the current computer.
			
		.NOTES
			Requires Connect-ePoServer to have been run first. All output is returned as a string currently, still looking
			into ways to convert it to an object.
			
	#>
	[CmdletBinding()]
	param
	(
		[Parameter(Mandatory=$True,
		ValueFromPipeline=$True, ValueFromPipelinebyPropertyName=$true)]
		[string]$Command,
		[string[]]$Parameters	
	)
	Begin{}
	Process 
	{
		If(!($Parameters))
		{
			$url = "$($epoServer)/remote/$($Command)&:output=xml"	
		}
		else
		{
			$url = "$($epoServer)/remote/$($Command)?$($Parameters)&:output=xml"
		}
		[xml](($wc.DownloadString($url)) -replace "OK:`r`n")
	}
	End{}
}