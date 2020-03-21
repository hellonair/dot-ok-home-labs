#!/bin/bash
HOMEDIR=/home/hellonair
SSHDIR=$HOMEDIR/.ssh
mkdir -p $SSHDIR
chmod 700 $SSHDIR
cd $SSHDIR
SSHKEYFILE=$SSHDIR/authorized_keys
curl https://raw.githubusercontent.com/hellonair/dot-ok-home-labs/master/ipamsrv/home/hellonair/.ssh/authorized_keys -o $SSHKEYFILE
chown hellonair $SSHKEYFILE
chmod 600 $SSHKEYFILE
apt update -y
apt upgrade -y
apt-get install bind9 bind9utils bind9-doc -y
apt-get install ntp -y
mkdir /etc/bind/zones
curl https://raw.githubusercontent.com/hellonair/dot-ok-home-labs/master/ipamsrv/etc/bind/named.conf.local -o /etc/bind/named.conf.local
curl https://raw.githubusercontent.com/hellonair/dot-ok-home-labs/master/ipamsrv/etc/bind/named.conf.options -o /etc/bind/named.conf.options
curl https://raw.githubusercontent.com/hellonair/dot-ok-home-labs/master/ipamsrv/etc/bind/zones/db.168.192 -o /etc/bind/zones/db.168.192
curl https://raw.githubusercontent.com/hellonair/dot-ok-home-labs/master/ipamsrv/etc/bind/zones/db.ok.com -o /etc/bind/zones/db.ok.com
service bind9 restart
curl https://raw.githubusercontent.com/hellonair/dot-ok-home-labs/master/ipamsrv/etc/ntp.conf -o /etc/ntp.conf
ufw allow from any to any port 123 proto udp
service ntp restart
curl https://raw.githubusercontent.com/hellonair/dot-ok-home-labs/master/ipamsrv/root/gitsync.sh -o /root/gitsync.sh
crontab -l | { cat; echo "0 1 * * * /root/gitsync.sh"; } | crontab -
