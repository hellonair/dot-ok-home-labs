<#

.SYNOPSIS
This is a powershell script to configure basic networking for OK labs

.DESCRIPTION
Reconfigure the ESXi host with a new static IP

.EXAMPLE
./esxipconfig.ps1 -oldip 10.10.10.1 -hostname <New hostname>

.NOTES
Developed for hellonair's ok labs.
This require a dns entry associated with the hostname and IP address

.AUTHOR
Hari Nair aka hellonair
#>



param(
     [Parameter()]
     [string]$oldip,
 
     [Parameter()]
     [string]$hostname
 
 )


$esxuser = 'root' # username to log into the host
$pass = 'Passw0rd!' # password for the esxi to login
$vmkName = 'vmk0' # vmk to change the the ip for. ex: vmk0
$vmkGw = '192.168.100.1'
$vmkMask = '255.255.255.0' # subnetmask
$ipamsrv='192.168.100.11'
$domain='ok'
$fqdn=$hostname+'.'+$domain

Write-Host "The host is running on IP Address $oldip"
Write-Host "New hostnmae given is $hostname"
$dnsrecord = Resolve-DnsName -Name $fqdn -Server $ipamsrv -Type A
$ipaddress = $dnsrecord.IPAddress[0]
Write-Host "The new IP address as DNS record is $ipaddress"
 
Connect-VIServer $oldip -User $user -Password $pass
$esxcli = Get-EsxCli
$esxcliset = $esxcli.network.ip.interface.ipv4.set
$esxcli.network.ip.interface.ipv4.set($vmkGw,$vmkName,$ipaddress,$vmkMask,$null,'static')
Disconnect-VIServer * -Confirm:$false -ErrorAction SilentlyContinue