lvm
---

    lvdisplay  （显示LV详细信息）
    lvreduce -L -1000m /dev/VolGroup/lv_swap 
    lvextend -L +920m /dev/VolGroup/lv_root

    resize2fs /dev/VolGroup/lv_root   （使增加的逻辑卷大小立即生效）
    lvscan  （显示调整后的LV情况）
    df -h （显示调整后的文件系统）


