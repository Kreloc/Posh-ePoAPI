Function Find-ePoDetectedSystem 
{
	<#	
		.SYNOPSIS
			Finds a system using the ePo API.
		
		.DESCRIPTION
			Sends the command specified to the McAfee EPO server. Connect-ePoServer has to be run first,
			as this function uses the epoServer global variable created by that functions connection to the server. Uses the Invoke-ePoCommand
		
		.PARAMETER Filter
			The search string to use for finding the detected system. This can be the DNS Name, Domain, NetBIOS information, User or IPv4 or IPv6 address.
            Defaults to a space which returns all of the detected systems.
			
		.EXAMPLE
			$CurrentPC = Find-ePoDetectedSystem -Filter $env:computername
			$CurrentPC
		
			Retruns the output of the system.find API command with a search paramter for the current computer.
			
		.EXAMPLE
			$FoundSystems = Find-ePoDetectedSystem -Filter "Mark"
			
			Returns an object of the results of the system.find search for systems with Mark as their user.

        .EXAMPLE
            $DomainFoundDetectedSystems = Find-ePoDetectedSystem -Filter "contonoso.com"
            $DomainFoundDetectedSystems

            Finds all of the detectedsystems with contonoso.com as their domain.
			
        .EXAMPLE			
            Find-ePoDetectedSystem -Verbose

            Finds all of the detecedsystems.

        .NOTES
            Added support for Whatif
	#>
	[CmdletBinding(SupportsShouldProcess=$true)]
	param
	(
		[Parameter(Mandatory=$False,
		ValueFromPipeline=$True, ValueFromPipelinebyPropertyName=$true)]
		[string]$Filter = " "
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
		$results = Invoke-ePoCommand -Command "detectedsystem.find" -Parameters "searchText=$($Filter)"
        If($PSCmdlet.ShouldProcess("$Filter","Creating output object for detectedsystem.find command results found using filter"))
        {         
            $FoundSystems = @()
		    ForEach($Computer in $results.result.list.row)
		    {
		        $props = @{ComputerName = ($Computer | Select -ExpandProperty RSDDetectedSystems.NetbiosName)
				        HostID = ($Computer | Select -ExpandProperty RSDDetectedSystems.HostID)
                        AgentGUID = ($Computer | Select -ExpandProperty RSDDetectedSystems.AgentGUID)
                        AgentVersion = ($Computer | Select -ExpandProperty RSDDetectedSystems.AgentVersion)
                        Comments = ($Computer | Select -ExpandProperty RSDDetectedSystems.Comments)
                        DetectedSourceName = ($Computer | Select -ExpandProperty RSDDetectedSystems.DetectedSourceName)
                        DeviceType = ($Computer | Select -ExpandProperty RSDDetectedSystems.DeviceType)
                        DNSName = ($Computer | Select -ExpandProperty RSDDetectedSystems.DnsName)
                        Domain = ($Computer | Select -ExpandProperty RSDDetectedSystems.Domain)
                        Exception = ($Computer | Select -ExpandProperty RSDDetectedSystems.Exception)
                        ExceptionCategory = ($Computer | Select -ExpandProperty RSDDetectedSystems.ExceptionCategory)
                        FriendlyComputerName = ($Computer | Select -ExpandProperty RSDDetectedSystems.FriendlyName)
                        Ignored = ($Computer | Select -ExpandProperty RSDDetectedSystems.Ignored)
                        Inactive = ($Computer | Select -ExpandProperty RSDDetectedSystems.Inactive)
                        IPv6 = ($Computer | Select -ExpandProperty RSDDetectedSystems.IPV6)
                        LastAgentCommunication = (Get-Date ($Computer | Select -ExpandProperty RSDDetectedSystems.LastAgentCommunication))
                        LastDetectedTime =  (Get-Date ($Computer | Select -ExpandProperty RSDDetectedSystems.LastDetectedTime))
                        LastReportingSensor = ($Computer | Select -ExpandProperty RSDDetectedSystems.LastReportingSensor)
                        MACAddress = ($Computer | Select -ExpandProperty RSDDetectedSystems.MAC)
                        Managed = ($Computer | Select -ExpandProperty RSDDetectedSystems.Managed)
                        Description = ($Computer | Select -ExpandProperty RSDDetectedSystems.NetbiosComment)
                        NewDetection = ($Computer | Select -ExpandProperty RSDDetectedSystems.NewDetection)
                        OrganizationName = ($Computer | Select -ExpandProperty RSDDetectedSystems.OrgName)
                        OSFamily = ($Computer | Select -ExpandProperty RSDDetectedSystems.OSFamily)
                        OS = ($Computer | Select -ExpandProperty RSDDetectedSystems.OSPlatform)
                        OSVersion = ($Computer | Select -ExpandProperty RSDDetectedSystems.OSVersion)
                        Rogue = ($Computer | Select -ExpandProperty RSDDetectedSystems.Rogue)
                        RogueAction = ($Computer | Select -ExpandProperty RSDDetectedSystems.RogueAction)
                        RogueState = ($Computer | Select -ExpandProperty RSDDetectedSystems.RogueState)
                        ServerName = ($Computer | Select -ExpandProperty RSDDetectedSystems.ServerName)
                        Users = ($Computer | Select -ExpandProperty RSDDetectedSystems.Users)

                 
		        }
		        $FoundSystems += New-Object -TypeName PSObject -Property $props
		    }
		    $FoundSystems
        }
	}
	End{}
}