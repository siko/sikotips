install
-------

sudo apt-get -y update

sudo apt-get -y install pptpd

configure
---------

sudo vi /etc/pptpd.confa

#确保如下选项的配置

option /etc/ppp/pptpd-option                    #指定PPP选项文件的位置

debug                                           #启用调试模式

localip 192.168.10.1                             #VPN服务器的虚拟ip

remoteip 192.168.10.200-238,192.168.10.245        #分配给VPN客户端的虚拟ip




sudo vi /etc/ppp/pptpd-options

#确保如下选项的配置

name pptpd                      #pptpd服务的名称

refuse-pap                      #拒绝pap身份认证模式

refuse-chap                     #拒绝chap身份认证模式

refuse-mschap                   #拒绝mschap身份认证模式

require-mschap-v2               #允许mschap-v2身份认证模式

require-mppe-128                #允许mppe 128位加密身份认证模式

ms-dns 8.8.8.8                  #使用Google DNS

ms-dns 8.8.4.4                  #使用Google DNS

proxyarp                        #arp代理

debug                           #调试模式

dump                            #服务启动时打印出所有配置信息

lock                            #锁定TTY设备

nobsdcomp                       #禁用BSD压缩模式

logfile /var/log/pptpd.log      #输出日志文件位置



sudo vi /etc/ppp/chap-secrets

#格式：用户名   服务类型   密码   分配的ip地址

test    *    1234    *

#第一个*代表服务可以是PPTPD也可以是L2TPD，第二个*代表随机分配ip

test
====

sudo service pptpd restart

sudo sed -i 's/#net.ipv4.ip_forward=1/net.ipv4.ip_forward=1/g' /etc/sysctl.conf

sudo sysctl -p


#注意这里eth0代表你的外网网卡，请用ifconfig查看或者咨询网络管理员

sudo iptables -t nat -A POSTROUTING -s 192.168.0.0/24 -o eth0 -j MASQUERADE

#如果上面的命令报错,那么可以尝试以下的命令，其中xxx.xxx.xxx.xxx代表你的VPS外网ip地址

sudo iptables -t nat -A POSTROUTING -s 192.168.0.0/24 -o eth0 -j SNAT --to-source xxx.xxx.xxx.xxx

sudo iptables -I FORWARD -s 192.168.0.0/24 -p tcp --syn -i ppp+ -j TCPMSS --set-mss 1300



