#!/bin/bash
#for disable ipv6
echo "Enable systcl parameters to disable it."
echo "net.ipv6.conf.all.disable_ipv6=1" >>  /etc/sysctl.conf
echo "net.ipv6.conf.default.disable_ipv6=1" >>  /etc/sysctl.conf
echo "net.ipv6.conf.lo.disable_ipv6=1" >>  /etc/sysctl.conf
echo "Making these changes effective to kernel"
sysctl -p
echo "creating rc.local with right command set"
cat > /etc/rc.local <<EOF
# /etc/rc.local
/etc/sysctl.d
/etc/init.d/procps restart
echo "Changing permission of the file to 755"
chmod 755 /etc/rc.local
echo "AddressFamily inet" >>  /etc/ssh/ssh_config
/etc/init.d/besclient restart
exit 0
EOF
