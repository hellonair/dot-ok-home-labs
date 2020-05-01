<#

.SYNOPSIS
This is a powershell script to create ESXi clusters for OK labs.

.DESCRIPTION
Create ESXi cluster
Add the ESXi Hosts to ESXi cluster

.EXAMPLE
./createClusterFrom.ps1 -jsonFile <file name>

.NOTES
Developed for hellonair's ok labs server builds and can be used with pre-conditions which are not listed here

.AUTHOR
Hari Nair aka hellonair
#>



param(
 
     [Parameter()]
     [string]$jsonFile
 
 )

#Reading from File

$clusterData = Get-Content -Raw -Path $jsonFile |ConvertFrom-Json

# Infrastructure

$vcsa = $clusterData.vcsa
$clusterName = $clusterData.clusterName
$dataCenter = $clusterData.dataCenter
$addESXi = $clusterData.hosts


# Credentials
$vcAdmin = "Administrator@vsphere.local"
$esxiAdmin = "root"
$passWord = "Passw0rd!"
# Process
Connect-VIServer -server $vcsa -User $vcAdmin -Password $passWord
Write-Host "Creating Datacenter $dataCenter" -ForegroundColor green
$location = Get-Folder -NoRecursion
New-DataCenter -Location $location -Name $dataCenter

New-Cluster -Name $clusterName -Location $dataCenter
$addESXi | ForEach-Object {Add-VMHost $_ -User $esxiAdmin -Password $passWord -Location $clusterName -force}
Disconnect-VIServer * -Confirm:$false -ErrorAction SilentlyContinue