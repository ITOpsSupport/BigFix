#!/bin/bash
#for disable ipv6
echo "Enable systcl parameters to disable it."
echo "net.ipv6.conf.all.disable_ipv6=1" >>  /etc/sysctl.conf
echo "net.ipv6.conf.default.disable_ipv6=1" >>  /etc/sysctl.conf
echo "net.ipv6.conf.lo.disable_ipv6=1" >>  /etc/sysctl.conf
echo "Making these changes effective to kernel"
sysctl -p
echo "AddressFamily inet" >>  /etc/ssh/ssh_config
/etc/init.d/besclient restart
exit 0
EOF
