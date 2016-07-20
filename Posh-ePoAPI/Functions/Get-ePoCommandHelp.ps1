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
            Get-ePoCommandHelp

            This will get a list of avaiable commands and their associated commandtext from the API.

		.EXAMPLE
			Get-ePoCommandHelp -Command "system.find" | Format-List
			
			Gets the help for the command system.find outputted into the Format-List Cmdlet

        .EXAMPLE
            $DetectedSystemAddHelp = Get-ePoCommandHelp -Command "detectedsystem.add"
            $DetectdSystemAddHelp.CommandUse

            Gets the help for the command detectedsystem.add and stores it in a variable. Then the property CommandUse is expanded. The ParameterValues
            property returns all of the parameters. Still working on getting the ParameterName to return the paramters that aren't on the first line.
            Any parameter in [] is optional.

        .EXAMPLE
            $ePoCommands | Where {$_.Command -like "*Computer*"} | Get-ePoCommandHelp

            This will get the help for each command found with Computer in the command name. Uses the script variable $ePoCommands that was created
            either by Connect-ePoServer or by running this function with the Command parameter set to All.

        .NOTES
            Can be used to list available ePoCommands by not specifying any parameters.
            Added support for an array of strings being used in the Command parameter.
            Added support for Whatif
            
			
	#>
	[CmdletBinding(SupportsShouldProcess=$true)]
	param
	(
		[Parameter(Mandatory=$False,
		ValueFromPipelinebyPropertyName=$true)]
		[string[]]$Command = "All"
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
        If($Command -eq "All")
        {
            If(!($ePoCommands))
            {
		        $ePoCommands = Invoke-ePoCommand -Command "core.help"
                $script:ePoCommands = @()
                If($PSCmdlet.ShouldProcess("ePoCommands","Creating PowerShell object as output from result of API command"))
                {
                    ForEach($Command in $ePoCommands.result.list.element)
                    {
                        $CommandName = ($Command -split ' ')[0]
                        $CommandUse = $Command -replace ".*-"
                        $props = @{Command=$CommandName
                                   CommandText=$CommandUse
                                  }
                        $ePoCommands += New-Object -TypeName PSObject -Property $props
                    }
                }
            }
            If($PSCmdlet.ShouldProcess("ePoCommands","Outputting PowerShell object of API Commands"))
            {
                $ePoCommands
            }
        }
        else
        {
            $CommandHelpOutput = @()
            ForEach($CommandNameItem in $Command)
            {
                $CommandNameItem = "command=$($CommandNameItem)"
                $CommandHelp = Invoke-ePOCommand -Command "core.help" -Parameters $CommandNameItem | Select -ExpandProperty Result
                If($PSCmdlet.ShouldProcess("$CommandNameItem","Retrieving help documentation for command"))
                {
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
                    $CommandHelpOutput += New-Object -TypeName PSObject -Property $props
                }
            }
            If($PSCmdlet.ShouldProcess("$Command","Outputting help object"))
            {
                $CommandHelpOutput
            }
        }

	}
	End{}
}