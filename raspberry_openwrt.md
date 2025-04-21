# openwrt

version: 24.10.0

## install

## config

![openwrt_network](https://img.wangdongdong9264.xyz/openwrt_network.jpg)

## expand

```shell

opkg install cfdisk fdisk

```

```shell

cfdisk /dev/mmcblk0

```

![openwrt_cfdisk_start](https://img.wangdongdong9264.xyz/openwrt_cfdisk_start.png)

`new` > `primary` >  `write` > `yes` > `quit`

![openwrt_cfdisk_end](https://img.wangdongdong9264.xyz/openwrt_cfdisk_end.png)

```shell

fdisk -l

```

![openwrt_fdisk](https://img.wangdongdong9264.xyz/openwrt_fdisk.png)

```shell

mkfs.ext4 /dev/mmcblk0p3

```

if your OS is from official, you can not find `mount points` select in system

```shell

opkg install block-mount

```

installed and `reboot`, you will find `mount points`

select your create disk and click edit

![openwrt_mount](https://img.wangdongdong9264.xyz/openwrt_mount.png)

selected `Enabled`

selected `Use as root filesystem`

save & apply

![openwrt_mount_set](https://img.wangdongdong9264.xyz/openwrt_mount_set.png)

```shell

mkdir -p /tmp/introot
mkdir -p /tmp/extroot
mount --bind / /tmp/introot
mount /dev/mmcblk0p3 /tmp/extroot # my path is /dev/mmcblk0p3
tar -C /tmp/introot -cvf - . | tar -C /tmp/extroot -xf -
umount /tmp/introot
umount /tmp/extroot

```

`reboot`

## v2ray
