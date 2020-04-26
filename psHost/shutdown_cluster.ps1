<#

.SYNOPSIS
This is a powershell script to shutdown ESxi clusters for OK labs.

.DESCRIPTION
Shutdown all ESXi hosts in the cluster


.EXAMPLE
./shutdown_cluster.ps1 -clusterName <cluster Name>

.NOTES
Developed for hellonair's ok labs server builds and can be used with pre-conditions which are not listed here

.AUTHOR
Hari Nair aka hellonair
#>

param(
 
     [Parameter()]
     [string]$clusterName
 
 )

# Infrastructure
$vcsa = "dc1vcsa70.ok"
$dc = "DC1"
# Credentials
$vcAdmin = "Administrator@vsphere.local"
$esxiAdmin = "root"
$passWord = "Passw0rd!"
# Process
Connect-VIServer -server $vcsa -User $vcAdmin -Password $passWord
Get-Cluster $clusterName |Get-VMHost
Get-Cluster $clusterName |Get-vmhost | Set-VMHost -State Maintenance –VsanDataMigrationMode NoDataMigration
Get-Cluster $clusterName |Get-VMHost | Stop-VMHost -Confirm:$false -Force