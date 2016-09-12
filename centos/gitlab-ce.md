ref https://github.com/gitlabhq/gitlab-recipes/tree/master/install/centos


    yum install curl openssh-server postfix cronie -y
    curl https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.rpm.sh | bash
    yum -y install gitlab-ce

    vim /etc/gitlab/gitlab.rb 

    gitlab-ctl reconfigure
    rpm -Uvh http://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-8.noarch.rpm
    rpm -Uvh http://rpms.famillecollet.com/enterprise/remi-release-7.rpm

    yum -y groupinstall 'Development Tools'
    yum -y install readline readline-devel ncurses-devel gdbm-devel glibc-devel tcl-devel openssl-devel curl-devel expat-devel db4-devel byacc sqlite-devel libyaml libyaml-devel libffi libffi-devel libxml2 libxml2-devel libxslt libxslt-devel libicu libicu-devel system-config-firewall-tui redis sudo wget crontabs logwatch logrotate perl-Time-HiRes git cmake libcom_err-devel.i686 libcom_err-devel.x86_64 nodejs
    yum -y install python-docutils htop net-tools vim

    vim .ssh/authorized_keys
    reboot

    #gitlab-ci-multi-runner
    
    curl -sSL https://get.docker.com/ | sh
    curl -L https://packages.gitlab.com/install/repositories/runner/gitlab-ci-multi-runner/script.rpm.sh | sudo bash
    yum install gitlab-ci-multi-runner
    gitlab-ci-multi-runner register
    dockerd

