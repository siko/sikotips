cd /root/BOINC/

./run_client --daemon
./boinccmd --project_attach http://www.worldcommunitygrid.org/ d07b8dfa74a29f457429a7191219a931
./boinccmd --project http://www.worldcommunitygrid.org/ allowmorework
./boinccmd --project http://www.worldcommunitygrid.org/ update

