# openwrt

version: 24.10.0

## install

## config

## expand

```shell

opkg install cfdisk fdisk

```

```shell

cfdisk /dev/mmcblk0

```

`new` > `primary` >  `write` > `yes` > `quit`

```shell

fdisk -l

```

```shell

mkfs.ext4 /dev/mmcblk0p3

```

if your OS is from official, you can not find `mount points` select in system

```shell

opkg install block-mount

```

installed and `reboot`, you will find `mount points`

select your create disk and click edit

selected `Enabled`

selected `Use as root filesystem`

save & apply

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
