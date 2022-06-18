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