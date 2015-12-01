Function Get-ePoCommandHelp 
{
	<#	
		.SYNOPSIS
			This returns the help for the specified command made available by the API.
		
		.DESCRIPTION
			This returns the help for the specified command made available by the API. Requires an active connection to the EpoServer.
		
		.PARAMETER Command
			The command to get help for.

		.EXAMPLE
			Get-ePoCommandHelp -Command "system.find"
			
			Gets the help for the command system.find
			
	#>
	[CmdletBinding()]
	param
	(
		[Parameter(Mandatory=$True,
		ValueFromPipelinebyPropertyName=$true)]
		[string]$Command	
	)
	Begin{}
	Process 
	{
		$url = "$($epoServer)/remote/core.help?command=$($Command)&:output=xml"
		[xml](($wc.DownloadString($url)) -replace "OK:`r`n") | Select -ExpandProperty Result
	}
	End{}
}