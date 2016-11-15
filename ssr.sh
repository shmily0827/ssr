#安装ssr
wget -N --no-check-certificate https://raw.githubusercontent.com/91yun/serverspeeder/master/serverspeeder-all.sh && bash serverspeeder-all.sh
iptables -I INPUT -m state --state NEW -m tcp -p tcp --dport 8989 -j ACCEPT
iptables -I INPUT -m state --state NEW -m udp -p udp --dport 8989 -j ACCEPT
iptables -I INPUT -m state --state NEW -m udp -p udp --dport 9002 -j ACCEPT
iptables -I INPUT -m state --state NEW -m tcp -p tcp --dport 9002 -j ACCEPT
iptables -I INPUT -m state --state NEW -m udp -p udp --dport 9003 -j ACCEPT
iptables -I INPUT -m state --state NEW -m tcp -p tcp --dport 9003 -j ACCEPT
iptables -I INPUT -m state --state NEW -m tcp -p tcp --dport 6646 -j ACCEPT
service iptables save
service iptables restart
/etc/init.d/shadowsocks stop
#优化设置
rm -rf /etc/security/limits.conf
cd /etc/security/
wget https://github.com/shmily0827/ssr/edit/master/limits.conf
ulimit -n 51200
sysctl net.ipv4.tcp_available_congestion_control
cp /etc/sysctl.conf /root/
rm -rf /etc/sysctl.conf
cd /etc
wget https://raw.githubusercontent.com/shmily0827/ssr/master/sysctl.conf
sysctl -p
#导入多用户配置
rm -rf /etc/shadowsocks.json
cd /etc
wget https://raw.githubusercontent.com/shmily0827/ssr/master/shadowsocks.json
#重启启ssr
/etc/init.d/shadowsocks restart
#denyhost 

