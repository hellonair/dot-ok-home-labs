<#

.SYNOPSIS
This is a powershell script to configure ESXi hosts for OK labs.

.DESCRIPTION
Reconfigure the esxi host deployed from ok labs template.
A static IP address will be configured based on the hostname given
Enable SSH service
Rename the local datastore
Configure NTP service


.EXAMPLE
./esxconfig.ps1 -hostname <newhostname>

.NOTES
Developed for hellonair's ok labs server builds and can be used with pre-conditions which are not listed here

.AUTHOR
Hari Nair aka hellonair
#>



param(
 
     [Parameter()]
     [string]$hostname
 
 )


#Data points
$oldip = '192.168.100.127'
$esxAdmin = 'root' # username to log into the host
$esxPass = 'Passw0rd!' # password for the esxi to login
$vmkName = 'vmk0' # vmk to change the the ip for. ex: vmk0
$vmkGw = '192.168.100.1'
$vmkMask = '255.255.255.0' # subnetmask
$ipamsrv='192.168.100.11'
$domain='ok'
$fqdn=$hostname+'.'+$domain


Write-Host "The host is running on IP Address $oldip"  -ForegroundColor Green
Write-Host "New hostnmae given is $hostname" -ForegroundColor Green
$dnsrecord = Resolve-DnsName -Name $fqdn -Server $ipamsrv -Type A
$ipaddress = $dnsrecord.IPAddress[0]
Write-Host "The new IP address as DNS record is $ipaddress" -ForegroundColor Green

#Connect to host with old IP and configure networking
Connect-VIServer $oldip -User $esxAdmin -Password $esxPass
Write-Host "Config 1. Configure hostname as $hostname" -ForegroundColor Yellow
Get-VMHost |Get-VMHostNetwork|Set-VMHostNetwork -HostName $hostname
Write-Host "Config 2. Configure DNS" -ForegroundColor Yellow
Get-VMHost |Get-VMHostNetwork|Set-VMHostNetwork -DnsAddress $ipamsrv
Get-VMHost |Get-VMHostNetwork|Set-VMHostNetwork -Domain $domain -SearchDomain $domain
Write-Host "Config 3. Enable SSH" -ForegroundColor Yellow
Get-VMHostService | Where { $_.Key -eq "TSM-SSH" } | Start-VMHostService
Get-VMHostService | Where { $_.Key -eq "TSM-SSH" } | Set-VMHostService -policy "on"
Write-Host "Config 4. Renaming the datastore" -ForegroundColor Yellow
Get-Datastore |Set-Datastore -Name $hostname
Write-Host "Config 5. Configure NTP" -ForegroundColor Yellow
Get-VMHost |Add-VMHostNtpServer -NtpServer $ipamsrv
Get-VmHostService | ? {$_.key -eq "ntpd"} | Start-VMHostService
Get-VmHostService | ? {$_.key -eq "ntpd"} | Set-VMHostService -policy "on"
Get-VMHostFirewallException | ? {$_.Name -eq "NTP client"} | Set-VMHostFirewallException -Enabled:$true


# Change IP to new static IP
Write-Host "Config 6. Configuring static IP with $ipaddress" -ForegroundColor Yellow
$esxcli = Get-EsxCli
$esxcliset = $esxcli.network.ip.interface.ipv4.set
$esxcli.network.ip.interface.ipv4.set($vmkGw,$vmkName,$ipaddress,$vmkMask,$null,'static')
Disconnect-VIServer * -Confirm:$false -ErrorAction SilentlyContinue
Write-Host "The esxi host configuration is completed with $fqdn and IP address $ipaddress" -ForegroundColor DarkMagenta