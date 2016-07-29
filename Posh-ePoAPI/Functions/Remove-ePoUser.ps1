Function Remove-ePoUser
{
	<#	
		.SYNOPSIS
			Removes a user from ePo API.
		
		.DESCRIPTION
			Removes the specifed user from ePo API using the core.removeUser API command. Needs either the Unique ID or Name
            of the user to remove
        
        .EXAMPLE
            Remove-ePoUser -UserName "network"
            
            Removes the user with the unique username network		


		.EXAMPLE
			$UserID = Get-ePoUser | Where {$_.FullName -like "Mark*"} | Remove-ePoUser
			
			Gets the users that have Full Names like Mark* and pipes them to Remove-ePoUser, using the UserID property of the Get-ePoUser function.
            This will remove each user account with a full name beginning with Mark.
			
            
        .NOTES
            Removes user using the core.removeUser API Command. Requires Global Administrator privilege on ePoServer.


        .LINK
            https://github.com/Kreloc
			
	#>
	[CmdletBinding(SupportsShouldProcess=$true)]
	param
	(
		[Parameter(Mandatory=$True,
		ValueFromPipeline=$True, ValueFromPipelinebyPropertyName=$true,
        ParameterSetName='ID')]
		[string]$UserID,
		[Parameter(Mandatory=$True,
		ValueFromPipeline=$True, ValueFromPipelinebyPropertyName=$true,
        ParameterSetName='Name')]
		[string]$UserName
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
        If($UserID)
        {
            $CommandParameter = "userId=$($UserID)"
        }
        If($UserName)
        {
            $CommandParameter = "userName=$($UserName)"
        }
        $results = Invoke-ePOCommand -Command "core.removeUser" -Parameters $CommandParameter
        If($PSCmdlet.ShouldProcess("$UserName","Outputting result of running remove for user"))
        {  
            $results
        }
    }
    End{}
}