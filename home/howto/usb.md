```
yum install -y ntfs-3g ntfsprogs
```

## basic use

```
dmesg -w # watch for usb insertion

sudo fdisk -l # to confirm

mkdir ~/usb
sudo mount -t ntfs-3g /dev/sdb1 ~/usb
sudo umount ~/usb
```

if you get an error mounting, try

```
sudo ntfsfix /dev/sdb1
```
