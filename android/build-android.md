base setup
----------

setup on ubuntu 14.04

    apt-get install openjdk-7-jdk
    apt-get install bison g++-multilib git gperf libxml2-utils

    sudo apt-get install git-core gnupg flex bison gperf libsdl1.2-dev\
    libesd0-dev libwxgtk2.8-dev squashfs-tools build-essential zip curl\
    libncurses5-dev zlib1g-dev pngcrush schedtool libxml2 libxml2-utils\
    xsltproc lzop libc6-dev schedtool g++-multilib lib32z1-dev lib32ncurses5-dev\
    lib32readline-gplv2-dev gcc-multilib libswitch-perl

SOC
---

Rockchip SoC 
    
    git clone https://bitbucket.org/T-Firefly/firefly-rk3288.git
    cd firefly-rk3288/kernel
    make firefly-rk3288_defconfig 
    make -j8 firefly-rk3288.img
    cd ..
    source build/envsetup.sh
    make -j8


refer links:
    http://source.android.com/source/initializing.html 
    http://radxa.com/Rock/Android_Build 
    https://bitbucket.org/T-Firefly/firefly-rk3288 
    http://wiki.t-firefly.com/index.php/Firefly-RK3288/Build_android 

