Basic setup for ubuntu
=====

remove the kenerl from the apt update. or you can install the VBoxGuestAdditions

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

Python setup
=====