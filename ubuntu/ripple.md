check cpu
---------

    uname -ar

64 ubuntu
---------


    apt-get install libxss1 libstdc++5 ia32-libs freeglut3 -y
    wget http://boinc.berkeley.edu/dl/boinc_7.2.34_x86_64-pc-linux-gnu.sh
    chmod +x boinc_7.2.34_x86_64-pc-linux-gnu.sh
    ./boinc_7.2.34_x86_64-pc-linux-gnu.sh
    cd BOINC/
    ./run_client --daemon
    ./boinccmd --project_attach http://www.worldcommunitygrid.org/ d07b8dfa74a29f457429a7191219a931
    ./boinccmd --project http://www.worldcommunitygrid.org/ update

32 ubuntu
---------

    apt-get install libxss1 libstdc++5 freeglut3 -y
    wget http://boinc.berkeley.edu/dl/boinc_7.2.34_i686-pc-linux-gnu.sh
    chmod +x boinc_7.2.34_i686-pc-linux-gnu.sh
    ./boinc_7.2.34_i686-pc-linux-gnu.sh
    cd BOINC/
    ./run_client --daemon
    ./boinccmd --project_attach http://www.worldcommunitygrid.org/ d07b8dfa74a29f457429a7191219a931
    ./boinccmd --project http://www.worldcommunitygrid.org/ update

64 ubuntu
---------

    apt-get install libxss1 libstdc++5 ia32-libs freeglut3 -y
    wget http://boinc.berkeley.edu/dl/boinc_7.2.33_x86_64-pc-linux-gnu.sh
    chmod +x boinc_7.2.33_x86_64-pc-linux-gnu.sh
    ./boinc_7.2.33_x86_64-pc-linux-gnu.sh
    cd BOINC/
    ./run_client --daemon
    ./boinccmd --project_attach http://www.worldcommunitygrid.org/ c7c2472690eb25f387623ee6ae855977
    ./boinccmd --project http://www.worldcommunitygrid.org/ update

