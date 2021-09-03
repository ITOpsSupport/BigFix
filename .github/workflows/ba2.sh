#!/bin/bash
mkdir BESClient
cd BESClient
wget https://github.com/ITOpsSupport/BigFix/blob/main/BESAgent-10.0.1.41-ubuntu10.amd64.deb?raw=true
wget https://raw.githubusercontent.com/ITOpsSupport/BigFix/main/actionsite.afxm
  dpkg -i BESAgent-10.0.1.41-ubuntu10.amd64.deb

/etc/init.d/besclient start

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

exit 0
EOF
echo "Changing permission of the file to 755"
chmod 755 /etc/rc.local     


#end
