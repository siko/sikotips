puppet master
=============

    aptitude -y install puppetmaster
    aptitude -y install puppet augeas-tools


    cat > /etc/puppet/manifests/site.pp << EOF
    node default {
        notify { "Hey ! It works !": }
    }
    EOF

    /etc/init.d/puppetmaster restart

foreman 
=======

    echo "deb http://deb.theforeman.org/ precise 1.3" > /etc/apt/sources.list.d/foreman.list 
    wget -q http://deb.theforeman.org/foreman.asc -O- | apt-key add -

    apt-get update && apt-get install foreman-installer
    foreman-installer


puppet client
=============


    aptitude -y install puppet augeas-tools


    augtool << EOF
    set /files/etc/puppet/puppet.conf/agent/pluginsync false
    set /files/etc/puppet/puppet.conf/agent/server s.vv5i.org
    save
    EOF

    puppet agent -vt --waitforcert 60

    puppetca sign -a

    augtool << EOF
    set /files/etc/default/puppet/START no
    save
    EOF


