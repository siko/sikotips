
# lvdisplay  （显示LV详细信息）
# # lvreduce -L -1000m /dev/VolGroup/lv_swap  （将lv_swap分区大小减少1000M。交换分区1G足矣）
# # lvextend -L +920m /dev/VolGroup/lv_root   （将lv_root分区扩展992M，这里要说明下，我原来释放1000M空间，但查下剩余空间时发现只有992M，所以我就加这个数字了，具体原因待查）
# 现在还只是改变了lv_root分区大小，但root文件系统里用 df -h 显示仍是2.5G，接下来需要调整文件系统的大小。
# # resize2fs /dev/VolGroup/lv_root   （使增加的逻辑卷大小立即生效）
# # lvscan  （显示调整后的LV情况）
# # df -h （显示调整后的文件系统）


