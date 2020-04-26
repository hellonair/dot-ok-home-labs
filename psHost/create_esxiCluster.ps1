<#

.SYNOPSIS
This is a powershell script to create ESXi clusters for OK labs.

.DESCRIPTION
Create ESXi cluster
Add the ESXi Hosts to ESXi cluster

.EXAMPLE
./create_esxiCluster.ps1 -clusterName <cluster Name>

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
$clusterName = "v7compute"
$dc = "DC1"
$addESXi=@("dc1esxi71","dc1esxi72","dc1esxi73","dc1esxi74","dc1esxi75","dc1esxi76")
# Credentials
$vcAdmin = "Administrator@vsphere.local"
$esxiAdmin = "root"
$passWord = "Passw0rd!"
# Process
Connect-VIServer -server $vcsa -User $vcAdmin -Password $passWord
New-Cluster -Name $clusterName -Location $dc
$addESXi | ForEach-Object {Add-VMHost $_ -User $esxiAdmin -Password $passWord -Location $clusterName -force}