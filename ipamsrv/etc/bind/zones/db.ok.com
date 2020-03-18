;
; BIND data file for local loopback interface
;
$TTL	604800
@	IN	SOA	ipamsrv.ok.com. root.ipamsrv.ok.com. (
			     10		; Serial
			 604800		; Refresh
			  86400		; Retry
			2419200		; Expire
			 604800 )	; Negative Cache TTL
;
@	IN	NS	localhost.
@	IN	A	127.0.0.1
@	IN	AAAA	::1
		IN	NS	ipamsrv.ok.com.
; Command Center ( 2 to 19 )
ipamsrv		IN	A	192.168.86.11
ipamsrvone	IN	A	192.168.100.11
ipamsrvtwo	IN	A	192.168.200.11
watcherone	IN	A	192.168.100.12
watchertwo	IN	A	192.168.200.12
; VCF 
vcfcb0		IN	A	192.168.100.20
vcfesxi21	IN	A	192.168.100.21
vcfesxi22	IN	A	192.168.100.22
vcfesxi23	IN	A	192.168.100.23
vcfesxi24	IN	A	192.168.100.24
vcfesxi25	IN	A	192.168.100.25
vcfesxi26	IN	A	192.168.100.26
; General compute cluster
dc1vcsa40	IN	A	192.168.100.40
dc1esxi41	IN	A	192.168.100.41
dc1esxi42	IN	A	192.168.100.42
; vSAN cluster
dc1vsan51	IN	A	192.168.100.51
dc1vsan52	IN	A	192.168.100.52
dc1vsan53	IN	A	192.168.100.53
dc1vsan54	IN	A	192.168.100.54
dc1vsan55	IN	A	192.168.100.55
dc1vsan56	IN	A	192.168.100.56
