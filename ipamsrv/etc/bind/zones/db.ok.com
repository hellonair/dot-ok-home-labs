;
; BIND data file for local loopback interface
;
$TTL	604800
@	IN	SOA	maas1011.ok.com. root.mas1011.ok.com. (
			     10		; Serial
			 604800		; Refresh
			  86400		; Retry
			2419200		; Expire
			 604800 )	; Negative Cache TTL
;
@	IN	NS	localhost.
@	IN	A	127.0.0.1
@	IN	AAAA	::1
		IN	NS	maas1011.ok.com.
; Command Center ( 2 to 19 )
maas1011	IN	A	192.168.86.11
maas10011	IN	A	192.168.100.11
maas20011	IN	A	192.168.200.11
dummyone	IN	A	192.168.100.12
dummytwo	IN	A	192.168.200.12
; VCF 
vcfcb0		IN	A	192.168.100.20
vcfesxi1	IN	A	192.168.100.21
vcfesxi2	IN	A	192.168.100.22
vcfesxi3	IN	A	192.168.100.23
vcfesxi4	IN	A	192.168.100.24
vcfesxi5	IN	A	192.168.100.25
vcfesxi6	IN	A	192.168.100.26
; General compute cluster
dc1vcsa1	IN	A	192.168.100.40
dc1esxi1	IN	A	192.168.100.41
dc1esxi2	IN	A	192.168.100.42
; vSAN cluster
dc1vsan4	IN	A	192.168.100.44
dc1vsan5	IN	A	192.168.100.45
dc1vsan6	IN	A	192.168.100.46
dc1vsan7	IN	A	192.168.100.47
dc1vsan8	IN	A	192.168.100.48
dc1vsan9	IN	A	192.168.100.49
