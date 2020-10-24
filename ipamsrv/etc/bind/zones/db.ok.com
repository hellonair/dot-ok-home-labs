;
; BIND data file for local loopback interface
;
$TTL	604800
@	IN	SOA	ipamsrv.ok.com. root.ipamsrv.ok.com. (
			     25		; Serial
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
bastion		IN	A	192.168.86.12
bastionone	IN	A	192.168.100.12
bastiontwo	IN	A	192.168.200.12
freenasone	IN	A	192.168.100.13
freenastwo	IN	A	192.168.200.13
dc1win14	IN	A	192.168.100.14
dc1win15	IN	A	192.168.100.15
; VCF 20-30 vRealize
dc1vlcm20	IN	A	192.168.100.20
dc1vidm21	IN	A	192.168.100.21
dc1vran22	IN	A	192.168.100.22	
; General compute cluster
dc1vcsa40	IN	A	192.168.100.40
dc1esxi41	IN	A	192.168.100.41
dc1esxi42	IN	A	192.168.100.42
dc1esxi43	IN	A	192.168.100.43
dc1esxi44	IN	A	192.168.100.44
; vSAN cluster
dc1vcsa50	IN	A	192.168.100.50
dc1esxi51	IN	A	192.168.100.51
dc1esxi52	IN	A	192.168.100.52
dc1vsan53	IN	A	192.168.100.53
dc1vsan54	IN	A	192.168.100.54
dc1vsan55	IN	A	192.168.100.55
dc1vsan56	IN	A	192.168.100.56
dc1vsan57	IN	A	192.168.100.57
dc1vsan58	IN	A	192.168.100.58
; General compute cluster
dc1vcsa60	IN	A	192.168.100.60
dc1esxi61	IN	A	192.168.100.61
dc1esxi62	IN	A	192.168.100.62
dc1esxi63	IN	A	192.168.100.63
dc1esxi64	IN	A	192.168.100.64
dc1vcsa65	IN	A	192.168.100.65
dc1vcsa67	IN	A	192.168.100.67
dc1esxi68	IN	A	192.168.100.68
dc1esxi69	IN	A	192.168.100.69
; vSphere 7
dc1vcsa70	IN	A	192.168.100.70
dc1esxi71	IN	A	192.168.100.71
dc1esxi72	IN	A	192.168.100.72
dc1esxi73	IN	A	192.168.100.73
dc1esxi74	IN	A	192.168.100.74
dc1esxi75	IN	A	192.168.100.75
dc1esxi76	IN	A	192.168.100.76
dc1vro77	IN	A	192.168.100.77
dc1esxi78	IN	A	192.168.100.78
dc1esxi79	IN	A	192.168.100.79
; Beta
dc1vcsa80	IN	A	192.168.100.80
dc1vrli89	IN	A	192.168.100.89
dc1vcsa90	IN	A	192.168.100.90
