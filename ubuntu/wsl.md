open webpage in terminal
---
    wslview www.google.com

open rust doc
----

add new scripts file

    touch ~/scripts/wsl_browser.sh 

```

#!/bin/bash

if [ "$#"  -lt 1 ]; then
        echo "$0: no args"
        exit 1
fi

OPEN_PATH=`wslpath -w $1 2>/dev/null`

if [ $? -eq 0 ]; then
        wslview $OPEN_PATH
else
        wslview $1
fi

```

change it 

    chmod +x ~/scripts/wsl_browser.sh

    export BROWSER="/home/siko/.scripts/wsl_browser.sh"

open rust doc

    rustup doc


Mirrored mode networking
===

https://learn.microsoft.com/en-us/windows/wsl/networking

https://learn.microsoft.com/en-us/windows/wsl/wsl-config#configuration-setting-for-wslconfig

.wslconfig to configure global settings across all installed distributions running on WSL 2.

wsl.conf to configure local settings per-distribution for each Linux distribution running on WSL 1 or WSL 2.


/etc/wsl.conf
-

```
[boot]
systemd=true

[network]
hostname = chenbin
generateHosts = false
generateResolvConf = false

[automount]
ldconfig = false
```

%UserProfile%/.wslconfig
-
```
[wsl2]
networkingMode=mirrored
```

Get started with databases on Windows Subsystem for Linux
===

https://learn.microsoft.com/en-us/windows/wsl/tutorials/wsl-database