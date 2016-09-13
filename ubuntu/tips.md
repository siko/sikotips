
make a img file


    dd if=/dev/zero of=file.img bs=1M count=50
    mkfs ext3 -F file.img
    mkdir -p /tmp/mount_tmp/ && sudo mount -o loop,rw,sync file.img /tmp/mount_tmp
    chmod -R ug+rw /tmp/mount_tmp
    unmount file.img
