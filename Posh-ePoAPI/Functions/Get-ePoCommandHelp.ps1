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
			Get-ePoCommandHelp -Command "system.find" | Format-List
			
			Gets the help for the command system.find outputted into the Format-List Cmdlet

        .EXAMPLE
            $DetectedSystemAddHelp = Get-ePoCommandHelp -Command "detectedsystem.add"
            $DetectdSystemAddHelp.CommandUse

            Gets the help for the command detectedsystem.add and stores it in a variable. Then the property CommandUse is expanded. The ParameterValues
            property returns all of the parameters. Still working on getting the ParameterName to return the paramters that aren't on the first line.
            Any parameter in [] is optional.
			
	#>
	[CmdletBinding()]
	param
	(
		[Parameter(Mandatory=$True,
		ValueFromPipelinebyPropertyName=$true)]
		[string]$Command	
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
		$url = "$($epoServer)/remote/core.help?command=$($Command)&:output=xml"
		$CommandHelp = [xml](($wc.DownloadString($url)) -replace "OK:`r`n") | Select -ExpandProperty Result
        #$CommandHelp
        $SplitHelp = $CommandHelp -split "`n"
        $CommandName = ($splithelp[0] -split " ")[0]
        $ParameterName = ($SplitHelp[0] -replace "^(.*? )","")
        $CommandUseArray = ($splithelp -split "Parameters:")
        $i = 0
        $CommandUse = Do
        {
            $CommandUseArray[$i]
            $i++
        }
        Until($CommandUseArray[$i] -like "")
        $ParamterValues = ($CommandHelp -split "Parameters:`n")[-1]
        $props = @{Command=$CommandName
            Parameters=$ParameterName
            CommandUse=$CommandUse
            ParameterValues=$ParamterValues
            FullHelpText=$SplitHelp
            }
        New-Object -TypeName PSObject -Property $props

	}
	End{}
}