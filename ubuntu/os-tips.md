启用Cron Log

    vim /etc/syslog.conf
    /etc/init.d/sysklogd restart
    /etc/init.d/cron restart


7zip 解压缩指定文件

    7z e xx.7z aa*.txt -r


查找软件库中的软件:

    apt-cache search 正则表达式


查找软件库中的软件:

    aptitude search 软件包


查找文件属于哪个包:

    dpkg -S filename


查找文件属于哪个包:

    apt-file search filename


查询软件xxx依赖哪些包:

    apt-cache depends xxx


查询软件xxx被哪些包依赖:

    apt-cache rdepends xxx


增加一个光盘源:

    sudo apt-cdrom add


系统升级:

    sudo apt-get update;sudo apt-get dist-upgrade


清除已删除包的残馀配置文件:

    dpkg -l |grep ^rc|awk '{print $2}' |sudo xargs dpkg -P


编译时缺少h文件的自动处理:  

    sudo auto-apt run ./configure


查看安装软件时下载包的临时存放目录:  

    ls /var/cache/apt/archives


备份当前系统安装的所有包的列表:  

    dpkg --get-selections | grep -v deinstall > ~/somefile


从备份的安装包的列表文件恢复所有包:  

    dpkg --set-selections < ~/somefile;sudo dselect


清理旧版本的软件缓存:  

    sudo apt-get autoclean


清理所有软件缓存:  

    sudo apt-get clean


删除系统不再使用的孤立软件:  

    sudo apt-get autoremove


查看包在服务器上面的地址:  

    apt-get -qq --print-uris install ssh | cut -d\' -f2


查看内核:  

    uname -a


查看Ubuntu版本:  

    cat /etc/issue 或 lsb_release -a


查看内核加载的模块:  

    lsmod


查看PCI设备:  

    lspci


查看USB设备:  

    lsusb -v


查看网卡状态:  

    sudo ethtool eth0


查看CPU信息:  

    cat /proc/cpuinfo


显示当前硬件信息:  

    sudo lshw


显示系统运行时间:  

    uptime


查看硬盘的分区:  

    sudo fdisk -l


硬盘分区:  

    sudo fdisk /dev/sda


硬盘格式化:  

    sudo mkfs.ext3 /dev/sda1


硬盘检查(请不要检查已经挂载的分区，否则容易损坏数据):  

    sudo fsck /dev/sda1


分区挂载:  

    sudo mount -t 文件系统类型 (-o nls=utf8 或 -o iocharset=utf8) 设备路经 访问路经 


分区卸载:  

    sudo umount 目录名或设备名


查看IDE硬盘信息:  

    sudo hdparm -i /dev/hda


查看STAT硬盘信息 :  

    sudo hdparm -I /dev/sda 或 sudo blktool /dev/sda id


查看硬盘剩馀空间:  

    df


查看目录占用空间:  

    du -hs 目录名


优盘没法卸载:  

    sync;fuser -km /media/usbdisk


查看硬盘当前读写情况:  

    sudo iostat -x 2


查看当前的内存使用情况:  

    free


动态显示进程执行情况:  

    top


查看当前有哪些进程:  

    ps -A


查看当前进程树:  

    pstree


中止一个进程:  

    kill 进程号 或 killall 进程名


强制中止一个进程:  

    kill -9 进程号 或 killall -9 进程名


图形方式中止一个程序:  

    xkill 出现骷髅标志的鼠标，点击需要中止的程序即可


查看进程打开的文件:  

    lsof -p


显示开启文件abc.txt的进程 :  

    lsof abc.txt 


显示22端口现在运行什么程序 :  

    lsof -i :22 


显示nsd进程现在打开的文件 :  

    lsof -c nsd


在后台运行程序，退出登录后，并不结束程序 :  

    nohup 程序 &


详细显示程序的运行信息 :  

    strace -f -F -o outfile 


增加系统最大打开文件个数:  

    ulimit -n 4096 或 echo 4096 > /proc/sys/fs/file-max


配置 ADSL :  

    sudo pppoeconf


ADSL手工拨号:  

    sudo pon dsl-provider


激活 ADSL:  

    sudo /etc/ppp/pppoe_on_boot


断开 ADSL :  

    sudo poff


查看拨号日志:  

    sudo plog


如何设置动态域名:  

    w3m -no-cookie -dump 'http://usere:pass@members.3322.org/dyndns/update?system=dyndns&hostname=yourdns.3322.org'


根据IP查网卡地址 :  

    arping IP地址


根据IP查电脑名 :

    nmblookup -A IP地址


查看当前IP地址 :  

    ifconfig eth0 |awk '/inet/ {split($2,x,":");print x[2]}'


查看当前外网的IP地址 :  

    w3m -no-cookie -dump www.123cha.com|grep -o '[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}'


查看当前监听80端口的程序 :  

    lsof -i :80


查看当前网卡的物理地址:  

    arp -a | awk '{print $4}'


同一个网卡增加第二个IP地址 :  

    sudo ifconfig eth0:0 1.2.3.4 netmask 255.255.255.0


立即让网络支持nat :  

    echo 1 | sudo tee /proc/sys/net/ipv4/ip_forward; sudo iptables -t nat -I POSTROUTING -j MASQUERADE 


查看路由信息:  

    netstat -rn 或 sudo route -n


手工增加一条路由 :  

    sudo route add -net 192.168.0.0 netmask 255.255.255.0 gw 172.16.0.1


手工删除一条路由:  

    sudo route del -net 192.168.0.0 netmask 255.255.255.0 gw 172.16.0.1


修改网卡MAC地址的方法 :  

    sudo ifconfig eth0 hw ether 00:AA:BB:CC:DD:EE


统计当前IP连接的个数 :  

    netstat -na|grep ESTABLISHED|awk '{print $5}'|awk -F: '{print $1}'|sort|uniq -c|sort -r -n


屏蔽IPV6 :  

    echo 'blacklist ipv6' | sudo tee /etc/modprobe.d/blacklist-ipv6


察看当前网络连接状况以及程序 :  

    sudo netstat -atnp


查看ADSL的当前流量:  

    sudo ethstatus -i ppp0


查看域名的注册备案情况:  

    whois baidu.cn


查看到某一个域名的路由情况:  

    tracepath baidu.cn


重新从服务器获得IP地址 :  

    sudo dhclient


下载网站文档:  

    wget -r -p -np -k http://www.xxx.com


如何5个线程下载:  

    axel -n 5 http://www.xxx.com/downloadfile.zip


添加一个服务:  

    sudo update-rc.d 服务名 defaults 99


删除一个服务 :  

    sudo update-rc.d 服务名 remove


临时重启一个服务:  

    /etc/init.d/服务名 restart


临时关闭一个服务:  

    /etc/init.d/服务名 stop


临时启动一个服务:  

    /etc/init.d/服务名 start


增加用户:  

    sudo adduser 用户名


删除用户:  

    sudo deluser 用户名


修改当前用户的密码:  

    passwd


修改用户密码:  

    sudo passwd 用户名


修改用户资料:  

    sudo chfn userid


如何禁用某个帐户:  

    sudo usermod -L 用户名 或 sudo passwd -l 用户名


如何启用某个帐户:  

    sudo usermod -U 用户名 或 sudo passwd -u 用户名


增加用户到admin组:  

    sudo usermod -G admin -a 用户名


配置默认Java使用哪个 :  

    sudo update-alternatives --config java


终端设置代理 :  

    export http_proxy=http://xx.xx.xx.xx:xxx


修改系统登录信息:  

    sudo vim /etc/motd


使用sun的java编译器:  

    sudo update-java-alternatives -s java-6-sun


切换输入法引擎:  

    im-switch -c


转换文件名由GBK为UTF8 :  

    convmv -r -f cp936 -t utf8 --notest --nosmart *


转换文件内容由GBK到UTF8 :  

    iconv -f gbk -t utf8 $i > newfile


转换 mp3 标签编码 :  

    sudo apt-get install python-mutagen;find . -iname '*.mp3' -execdir mid3iconv -e GBK {} \;


控制台下显示中文 :  

    sudo apt-get install zhcon;zhcon --utf8 --drv=vga


lftp 登录远程Windows中文FTP　:  

    lftp :~>set ftp:charset GBK


PDF 文件乱码 :  

    sudo apt-get install xpdf-chinese-simplified xpdf-chinese-traditional poppler-data


一屏查看文件内容 :  

    cat 文件名


分页查看文件内容:  

    more 文件名


可控分页查看文件内容:  

    less 文件名


根据字符串匹配来查看文件部分内容:  

    grep 字符串 文件名


显示包含字符串的文件名:  

    grep -l -r 字符串 路径


显示不包含字符串的文件名:  

    grep -L -r 字符串 路径


快速查找某个文件:  

    find 目录 -name 文件名


创建两个空文件:  

    touch file1 file2


递归式创建一些嵌套目录:  

    mkdir –p /tmp/xxs/dsd/efd


递归式删除嵌套目录:  

    rm –fr /tmp/xxs


回当前用户的宿主目录:  

    cd ~


查看当前所在目录的绝对路经:  

    pwd


列出当前目录下的所有文件:  

    ls -a


移动路径下的文件并改名:  

    mv 路径/文件 /新路径/新文件名


复制文件或者目录:  

    cp -av 原文件或原目录 新文件或新目录


查看文件类型:  

    file filename


对比两个文件之间的差异:  

    diff file1 file2


显示xxx文件倒数6行的内容 :  

    tail -n 6 xxx


不停地显示最新的内容 :  

    tail -n 10 -f /var/log/apache2/access.log


查看文件第五行到第10行的内容 :  

    sed -n '5,10p' /var/log/apache2/access.log


查找关于xxx的命令 :  

    apropos xxx 或 man -k xxx


通过ssh传输文件 :  

    scp -rp /path/filename username@remoteIP:/path 


把所有文件的后辍由rm改为rmvb :  

    rename 's/.rm$/.rmvb/' *


把所有文件名中的大写改为小写:  

    rename 'tr/A-Z/a-z/' *


删除特殊文件名 --help.txt 的文件:  

    rm -- --help.txt 或 rm ./--help.txt


查看当前目录的子目录:  

    ls -d */. 或 echo */.


将最近30天访问过的文件移动到上级back目录 :  

    find . -type f -atime -30 -exec mv {} ../back \;


显示一小时以内的包含 xxxx 的文件:  

    find . -type f -mmin -60|xargs -i grep -l xxxx '{}'


显示最近2小时到8小时之内的文件:  

    find . -mmin +120 -mmin -480 -exec more {} \;


删除修改时间在30天之前的文件 :  

    find . -type f -mtime +30 -mtime -3600 -exec rm {} \;


删除访问时间在30天之前的文件 :  

    find . -type f -atime +30 -atime -3600 -exec rm {} \;


删除掉guest的以avi或rm结尾的文件:  

    find . -name '*.avi' -o -name '*.rm' -user 'guest' -exec rm {} \;


删除掉不以java和xml结尾7天没有使用的文件 :  

    find . ! -name *.java ! -name '*.xml' -atime +7 -exec rm {} \;


删除所有的 .svn 目录 :  

    find . -name .svn -type d -exec rm -fr {} \;


删除所有以“~”结尾的临时文件 :  

    find . -name '*~' -exec rm {} \;


统计当前文件个数:  

    ls .|wc -w


统计当前目录个数:  

    ls -l |grep ^d|wc -l


显示当前目录下2006-01-01的文件名 :  

    ls -l |grep 2006-01-01 |awk '{print $8}'


使用ssh方式同步远程数据到本地目录 :  

    rsync -Pa -I --size-only --delete --timeout=300 Remote_IP:/home/ubuntu /backup


增加 7Z 压缩软件:  

    sudo apt-get install p7zip p7zip-full p7zip-rar


增加 rar 软件压缩和解压缩支持 :  

    sudo apt-get install rar unrar


解压缩 xxx.tar.gz :  

    tar -zxvf xxx.tar.gz


解压缩 xxx.tar.bz2 :  

    tar -jxvf xxx.tar.bz2


压缩aaa bbb目录为xxx.tar.gz :  

    tar -zcvf xxx.tar.gz aaa bbb


压缩aaa bbb目录为xxx.tar.bz2 :  

    tar -jcvf xxx.tar.bz2 aaa bbb


增加 lha 支持 :  

    sudo apt-get install lha


增加解 cab 文件支持 :  

    sudo apt-get install cabextract

显示日历:  

    cal


设置日期:  

    date -s mm/dd/yy


设置时间:  

    date -s HH:MM


将时间写入CMOS :  

    hwclock --systohc


查看CMOS时间 :  

    hwclock --show


读取CMOS时间 :  

    hwclock --hctosys


从服务器上同步时间 :  

    sudo ntpdate ntp.ubuntu.com


设置电脑的时区为上海:  

    sudo cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime


关闭UTC，将当前时间写入CMOS。:  

    sudo sed -ie 's/UTC=yes/UTC=no/g' /etc/default/rcS;sudo hwclock --systohc


修改mysql的root口令 :  

    sudo mysqladmin -u root -p password '你的新密码'


如何使用命令关闭显示器 :  

    xset dpms force off


设置CPU的频率 :  

    sudo apt-get install cpufrequtils;sudo cpufreq-info 


命令关机:  

    sudo halt


现在关机:  

    sudo shutdown -h now


晚上11点自动关机:  

    sudo shutdown -h 23:00


60分钟后关机:  

    sudo shutdown -h +60


命令重启电脑:  

    sudo reboot


现在重启电脑:  

    sudo shutdown -r now


关闭笔记本的触摸板 :  

    synclient touchpadoff=1


开启笔记本的触摸板:  

    synclient touchpadoff=0


统计每个单词的出现频率并排序 :  

    awk '{arr[$1]+=1 }END{for(i in arr){print arr[i]"\t"i}}' FILE_NAME | sort -rn


统计80端口的连接并排序 :  

    netstat -na|grep :80|awk '{print $5}'|awk -F: '{print $1}'|sort|uniq -c|sort -r -n


把终端加到右键菜单:  

    sudo apt-get install nautilus-open-terminal 


如何删除Totem电影播放机的播放历史记录 :  

    rm ~/.recently-used


vim 如何显示彩色字符 :  

    sudo cp /usr/share/vim/vimcurrent/vimrc_example.vim /usr/share/vim/vimrc


让 vim 直接支持编辑 .gz 文件 :  

    sudo apt-get install vim-full


vim 如何显示行号:  

    :set number


查看在会话设置的启动程序:  

    ls ~/.config/autostart


提高wine的反应速度 :  

    sudo sed -ie '/GBK/,/^}/d' /usr/share/X11/locale/zh_CN.UTF-8/XLC_LOCALE


制作ISO文件:  

    mkisofs -o test.iso -Jrv -V test_disk /home/carla/


延迟10秒抓图:  

    gnome-screenshot -d 10


延迟5秒抓当前激活窗口:  

    gnome-screenshot -w -d 5


如何命令行刻录:  

    cdrecord -scanbus;cdrecord -v -eject speed=8 dev=1,1,0 test.iso


回收站在哪里:  

    ~/.local/share/Trash/


默认打开方式的配置文件在哪里:  

    ~/.local/share/applications/mimeapps.list


如何查看HTTP头:  

    w3m -dump_head http://www.xxx.com


连续监视内存使用情况:  

    watch -d free


何切换到root帐号:  

    sudo -Hs


只读挂载ntfs分区:  

    sudo mount -t ntfs -o nls=utf8,umask=0 /dev/sdb1 /mnt/c


可写挂载ntfs分区:  

    sudo mount -t ntfs-3g -o locale=zh_CN.utf8,umask=0 /dev/sdb1 /mnt/c


挂载fat32分区:  

    sudo mount -t vfat -o iocharset=utf8,umask=0 /dev/sda1 /mnt/c


挂载共享文件:  

    sudo mount -t smbfs -o username=xxx,password=xxx,iocharset=utf8 //192.168.1.1/share /mnt/share


挂载ISO文件:  

    sudo mount -t iso9660 -o loop,utf8 xxx.iso /mnt/iso


带行号显示文件的内容:  

    nl 文件名


批量将rmvb转为avi:  

    for i in *; do mencoder -oac mp3lame -lameopts vbr=3 -ovc xvid -xvidencopts fixed_quant=4 -of avi $i -o `echo $i | sed -e 's/rmvb$/avi/'`; done


批量将svg转为png:  

    for i in *; do inkscape $i --export-png=`echo $i | sed -e 's/svg$/png/'`; done


批量缩小图片到30%:  

    for i in *; do convert -resize 30%x30% $1 sm-$1; done


批量转换jpg到png:  

    for i in *; do convert $i `echo $i | sed -e 's/jpg$/png/'`; done


获取jpg的扩展信息(Exif):  

    identify -verbose xxx.jpg


查看当前系统所有的监听端口:  

    nc -zv localhost 1-65535


去掉文件中的^M:  

    cat filename | tr -d "^M" > newfile


去掉文件中的^M:  

    sed -e "s/^M//g" filename > newfile


转换bin/cue到iso文件:  

    sudo apt-get install bchunk;bchunk image.bin image.cue image


转换目录到iso文件:  

    mkisofs dirname -o isofile.iso


转换CD到iso文件:  

    dd if=/dev/cdrom of=isofile.iso


ape转换为flac:  

    sudo apt-get install flac shntool;shntool split -t "%n.%p-%t" -f example_UTF-8.cue -o flac example.ape -d flacOutputDir


ape转换为mp3:  

    sudo apt-get install flac shntool lame;shntool split -t "%n.%p-%t" -f example_UTF-8.cue -o 'cust ext=mp3 lame --r3mix -b 320 --quiet - %f' example.ape -d mp3OutputDir


检查本地是否存在安全隐患:  

    sudo apt-get install rkhunter;rkhunter --checkall


如何安装杀毒软件:  

    sudo apt-get install clamav;clamscan -r ~/


查看网络连接状态:  

    netstat -n | awk '/^tcp/ {++S[$NF]} END {for(a in S) print a, S[a]}'


统计程序的内存耗用:  

    ps -eo fname,rss|awk '{arr[$1]+=$2} END {for (i in arr) {print i,arr[i]}}'|sort -k2 -nr


显示当前内存大小:  

    free -m |grep "Mem" | awk '{print $2}'


按内存从大到小排列进程:  

    ps -eo "%C : %p : %z : %a"|sort -k5 -nr


按cpu利用率从大到小排列进程:  

    ps -eo "%C : %p : %z : %a"|sort -nr


统计当前目录下所有jpg文件的尺寸:  

    find . -name *.jpg -exec wc -c {} \;|awk '{print $1}'|awk '{a+=$1}END{print a}'

清除僵死进程:  

    ps -eal | awk '{ if ($2 == "Z") {print $4}}' | sudo kill -9


CD 抓轨为 mp3 (有损):  

    sudo apt-get install abcde;abcde -o mp3 -b


CD 抓轨为 Flac (无损):  

    sudo apt-get install abcde;abcde -o flac -b


显示系统安装包的统计信息:  

    apt-cache stats


显示系统全部可用包的名称:  

    apt-cache pkgnames


显示包的信息:  

    apt-cache show k3b


