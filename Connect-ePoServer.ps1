Function Connect-ePoServer 
{
	<#	
		.SYNOPSIS
			The Connect-ePoServer function establishes a connection the McAfee EPO Server.
		
		.DESCRIPTION
			The Connect-ePoServer function establishes a connection the McAfee EPO Server. All results are returned in XML
			format. The System.Net below is to bypass unstrusted https, which the server in my environment returns. Lists all
			of the commands available after a successful connection has been made.
		
		.PARAMETER ePOServer
			The url used to access the McAfee EPO.

		.EXAMPLE
			Connect-ePoServer
			
			Connects to the default McAfee EPO Server.
			
		.EXAMPLE
			Connect-ePoServer -ePOServer "https://yourserver"
			
			Connects to the McAfee EPO Server at https://yourserver
			
		.NOTES
			This function creates two global variables, ePOServer and ePOCommands. ePOServer is the url of the McAfee EPO Server and ePOCommands is an XML
			variable of all of the commands available to the current user.
			
	#>
	[CmdletBinding()]
	param
	(
		[Parameter(Mandatory=$False,
		ValueFromPipeline=$True, ValueFromPipelinebyPropertyName=$true)]
		[alias("CN","MachineName")]
		[string]$ePOServer	= "https://avjnu01:8443"
	)
	Begin
	{
		add-type @"
    using System.Net;
    using System.Security.Cryptography.X509Certificates;
    public class TrustAllCertsPolicy : ICertificatePolicy {
        public bool CheckValidationResult(
            ServicePoint srvPoint, X509Certificate certificate,
            WebRequest request, int certificateProblem) {
            return true;
        }
    }
"@
[System.Net.ServicePointManager]::CertificatePolicy = New-Object TrustAllCertsPolicy

		$global:epoServer = $ePOServer
		$Credentials = Get-Credential
		$epoUser= $Credentials.GetNetworkCredential().username
		$epoPassword=$Credentials.GetNetworkCredential().password
		$global:wc=new-object System.net.WebClient
		$wc.Credentials = New-Object System.Net.NetworkCredential -ArgumentList ($epouser,$epopassword)
	}
	Process 
	{
		$url = "$($epoServer)/remote/core.help?:output=xml"
		$global:ePoCommands = [xml](($wc.DownloadString($url)) -replace "OK:`r`n")
		$ePoCommands.result.list.element
	}
	End{}
}