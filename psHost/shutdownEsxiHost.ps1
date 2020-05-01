<#

.SYNOPSIS
This is a powershell script to shutdown ESxi clusters for OK labs.

.DESCRIPTION
Shutdown all ESXi hosts in the cluster


.EXAMPLE
./shutdownEsxiHost.ps1 -hostName <ESXi Hos Name>

.NOTES
Developed for hellonair's ok labs server builds and can be used with pre-conditions which are not listed here

.AUTHOR
Hari Nair aka hellonair
#>

param(
 
     [Parameter()]
     [string]$hostName
 
 )


$esxiAdmin = "root"
$passWord = "Passw0rd!"
# Process
Connect-VIServer -server $hostName -User $esxAdmin -Password $passWord
Stop-VMHost -Confirm:$false -Force
Disconnect-VIServer -server $hostname