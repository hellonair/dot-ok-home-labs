#!/bin/bash
curl https://raw.githubusercontent.com/hellonair/dot-ok-home-labs/master/ipamsrv/etc/bind/named.conf.local -o /etc/bind/named.conf.local
curl https://raw.githubusercontent.com/hellonair/dot-ok-home-labs/master/ipamsrv/etc/bind/named.conf.options -o /etc/bind/named.conf.options
curl https://raw.githubusercontent.com/hellonair/dot-ok-home-labs/master/ipamsrv/etc/bind/zones/db.168.192 -o /etc/bind/zones/db.168.192
curl https://raw.githubusercontent.com/hellonair/dot-ok-home-labs/master/ipamsrv/etc/bind/zones/db.ok.com -o /etc/bind/zones/db.ok.com
service bind9 restart
