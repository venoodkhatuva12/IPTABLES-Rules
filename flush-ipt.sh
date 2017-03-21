#!/bin/bash
#Script made for IPTables and Firewalld Flushing All Rules
#Author: Vinod.N K
#Usage: IPTables Flushing All Rules
#Distro : Linux -Centos, Rhel, and any fedora
# http://www.linuxgeekstuff.com
#Check whether root user is running the script

if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

echo "Stopping firewall and allowing everyone..."
ipt="/sbin/iptables"
## Failsafe - die if /sbin/iptables not found 
[ ! -x "$ipt" ] && { echo "$0: \"${ipt}\" command not found."; exit 1; }
$ipt -P INPUT ACCEPT
$ipt -P FORWARD ACCEPT
$ipt -P OUTPUT ACCEPT
$ipt -F
$ipt -X
$ipt -t nat -F
$ipt -t nat -X
$ipt -t mangle -F
$ipt -t mangle -X
$ipt iptables -t raw -F 
$ipt -t raw -X
