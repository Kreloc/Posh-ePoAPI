Function Get-ePoPermissionSet 
{
	<#	
		.SYNOPSIS
			Gets users from ePo API.
		
		.DESCRIPTION
			Gets users from ePo API using the core.exportPermissionSets API command.
		
		.EXAMPLE
			Get-ePoPermissionSet
			
			Gets all of the permission sets returned by the core.exportPermissionSets API command.
			
            
        .NOTES
            Gets users using the core.exportPermissionSetes API Command. Requires Global Administration access on ePoServer.
            Still need to figure out how to parse <roles> infor in innerXml

        .LINK
            https://github.com/Kreloc
			
	#>
	[CmdletBinding(SupportsShouldProcess=$true)]
	param
	()
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

        $results = Invoke-ePOCommand -Command "core.exportPermissionSets"
        If($PSCmdlet.ShouldProcess("ePoUsers","Creating PowerShell object as output from result of API command"))
        {
            $Users = ForEach($user in $results.result.list.user)
            {
                If($user.disabled -like "false")
                {
                    $Disabled = $False
                }
                else
                {
                    $Disabled = $True
                }
                If($user.admin -like "true")
                {
                    $Admin = $True
                }
                else
                {
                    $Admin = $False
                }
                $props = @{
                           UserID = $user | Select -ExpandProperty id
                           Name = $user | Select -ExpandProperty name
                           FullName = $user | Select-Object -ExpandProperty fullname
                           Email = $User | Select-Object -ExpandProperty email
                           PhoneNumber = $user | Select-Object -ExpandProperty phoneNumber
                           Disabled = $Disabled
                           Admin = $Admin
                           AuthenticationType = $user | Select-Object -ExpandProperty authType
                           AuthenticationDetails = $user | Select-Object -ExpandProperty authDetails
                           Notes = $user | Select-Object -ExpandProperty notes
                           AllowedIPs = $user | Select-Object -ExpandProperty allowedIPs
                }
                New-Object -TypeName psobject -Property $props
            }
            $Users
        }
	}
	End{}
}