#!/bin/bash
cd /
curl https://raw.githubusercontent.com/hellonair/dot-ok-home-labs/master/ipamsrv/etc/bind/named.conf.local -o /etc/bind/named.conf.local
curl https://raw.githubusercontent.com/hellonair/dot-ok-home-labs/master/ipamsrv/etc/bind/named.conf.options -o /etc/bind/named.conf.options
curl https://raw.githubusercontent.com/hellonair/dot-ok-home-labs/master/ipamsrv/etc/bind/zones/db.168.192 -o /etc/bind/zones/db.168.192
curl https://raw.githubusercontent.com/hellonair/dot-ok-home-labs/master/ipamsrv/etc/bind/zones/db.ok.com -o /etc/bind/zones/db.ok.com
cd /
rm /etc/resolv.conf
# Bug fix with NXDOMAIN error
ln -sf /run/systemd/resolve/resolv.conf /etc/resolv.confresolv.conf /etc/resolv.conf
service bind9 restart
