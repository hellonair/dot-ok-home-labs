<#

.SYNOPSIS
This is a powershell script to shutdown the vCenter

.DESCRIPTION
Shutdown the vCenter appliance

.EXAMPLE
./shutdown_vcsa.ps1 -vcsa <vCenter Appliance>

.NOTES
Developed for hellonair's ok labs server builds and can be used with pre-conditions which are not listed here

.AUTHOR
Hari Nair aka hellonair
#>



param(
 
     [Parameter()]
     [string]$vcsa
 
 )

# Infrastructure
$vcsa = "dc1vcsa70.ok"
$vamiAdmin = "root"
$passWord = "Passw0rd!"

## Connect to our VCSA first.
$cisConnection = Connect-CisServer -server $vcsa
## Get the object
$shutdownAPI = Get-CisService -Name "com.vmware.appliance.shutdown"
 
## And execute the method to power off.
$shutdownAPI.poweroff