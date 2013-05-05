Basic setup for ubuntu
=====

remove the kenerl from the apt update. or you can install the VBoxGuestAdditions after upgrade the kenerl.

> $sudo -s
>
> $echo linux-generic hold | dpkg --set-selections
>
> $echo linux-headers-generic hold | dpkg --set-selections
>
> $echo linux-image-generic hold | dpkg --set-selections
>
> $echo linux-restricted-modules-generic hold | dpkg --set-selections
>
> $sudo apt-get update && sudo apt-get upgrade
>
> $sudo apt-get install aptitude  build-essential automake autoconf autotools-dev ftp unzip sysv-rc-conf curl -y



Python setup
=====

Install pythonbrew
-----

more info please refer [PythonBrew](https://github.com/utahta/pythonbrew)
>
The recommended way to download and install pythonbrew is to run these statements in your shell::

>  curl -kL http://xrl.us/pythonbrewinstall | bash

After that, pythonbrew installs itself to ~/.pythonbrew.

Please add the following line to the end of your ~/.bashrc::

>  [[ -s $HOME/.pythonbrew/etc/bashrc ]] && source $HOME/.pythonbrew/etc/bashrc


Install 2.7.3,3.3.0 and switch
>   pythonbrew install 2.7.3 3.3.0
>
>   pythonbrew switch 2.7.2


Create isolated python environments (uses virtualenv)::

>  pythonbrew venv init
>
>  pythonbrew venv create pygogo
>
>  pythonbrew venv list
>
>  pythonbrew venv use pygogo




