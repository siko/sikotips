locale
-------------

    echo "en_US.UTF-8 UTF-8" > /var/lib/locales/supported.d/enus
    locale-gen
    update-locale LANG=en_US.UTF-8 LC_MESSAGES=POSIX


pro setup
---------

    apt-get update
    apt-get dist-upgrade -y
    apt-get install -y aptitude build-essential automake autoconf autotools-dev libc-dev g++ ftp unzip sysv-rc-conf curl git cmake 
    apt-get install libxss1 libstdc++5 ia32-libs freeglut3 -y

remove no need
--------------

    aptitude remove bind9 samba apache2
    sysv-rc-conf apache2 off
    sysv-rc-conf sendmail off
    sysv-rc-conf bind9 off

check cpu
---------

    uname -ar

64 ubuntu
---------

    wget http://boinc.berkeley.edu/dl/boinc_7.2.34_x86_64-pc-linux-gnu.sh
    chmod +x boinc_7.2.34_x86_64-pc-linux-gnu.sh
    ./boinc_7.2.34_x86_64-pc-linux-gnu.sh
    cd BOINC/
    ./run_client --daemon
    ./boinccmd --project_attach http://www.worldcommunitygrid.org/ d07b8dfa74a29f457429a7191219a931
    ./boinccmd --project http://www.worldcommunitygrid.org/ update

32 ubuntu
---------

    wget http://boinc.berkeley.edu/dl/boinc_7.2.34_i686-pc-linux-gnu.sh
    chmod +x boinc_7.2.34_i686-pc-linux-gnu.sh
    ./boinc_7.2.34_i686-pc-linux-gnu.sh
    cd BOINC/
    ./run_client --daemon
    ./boinccmd --project_attach http://www.worldcommunitygrid.org/ d07b8dfa74a29f457429a7191219a931
    ./boinccmd --project http://www.worldcommunitygrid.org/ update

64 ubuntu
---------

    wget http://boinc.berkeley.edu/dl/boinc_7.2.33_x86_64-pc-linux-gnu.sh
    chmod +x boinc_7.2.33_x86_64-pc-linux-gnu.sh
    ./boinc_7.2.33_x86_64-pc-linux-gnu.sh
    cd BOINC/
    ./run_client --daemon
    ./boinccmd --project_attach http://www.worldcommunitygrid.org/ c7c2472690eb25f387623ee6ae855977
    ./boinccmd --project http://www.worldcommunitygrid.org/ update


check bash
----------

    scp root@l1.pprj.com:/etc/cron.hourly/boinc /etc/cron.hourly/

add the ssh
-----------

    ([ -f ~/.ssh/id_rsa.pub ] || ssh-keygen -t rsa ) && (ssh root@pprj.com "([ -d ~/.ssh ]||mkdir -m 700 ~/.ssh) && cat >> ~/.ssh/authorized_keys && chmod 600 ~/.ssh/authorized_keys" < ~/.ssh/id_rsa.pub)

cc_config.xml
-------------
    
    vim /root/BOINC/cc_config.xml
    <cc_config>
        <options>
            <ncpus>x</ncpus>
        </options>
    </cc_config>

    
