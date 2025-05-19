# openwrt

version: 24.10.0

## install

## config

![openwrt_network](https://img.wangdongdong9264.xyz/openwrt_network.jpg)

my switch ip is `192.168.1.1`

## expand

```sh

opkg install cfdisk fdisk

```

```sh

cfdisk /dev/mmcblk0

```

![openwrt_cfdisk_start](https://img.wangdongdong9264.xyz/openwrt_cfdisk_start.png)

`new` > `primary` >  `write` > `yes` > `quit`

![openwrt_cfdisk_end](https://img.wangdongdong9264.xyz/openwrt_cfdisk_end.png)

```sh

fdisk -l

```

![openwrt_fdisk](https://img.wangdongdong9264.xyz/openwrt_fdisk.png)

```sh

mkfs.ext4 /dev/mmcblk0p3

```

if your OS is from official, you can not find `mount points` select in system

```sh

opkg install block-mount

```

installed and `reboot`, you will find `mount points`

select your create disk and click edit

![openwrt_mount](https://img.wangdongdong9264.xyz/openwrt_mount.png)

selected `Enabled`

selected `Use as root filesystem`

save & apply

![openwrt_mount_set](https://img.wangdongdong9264.xyz/openwrt_mount_set.png)

```sh

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

```sh

opkg install v2raya luci-app-v2raya v2ray-geoip v2ray-geosite

```

`reboot`

`services` > `v2rayA`  click `Open Web Interface`

create your `username` and `password`

open setting

![openwrt_v2ray](https://img.wangdongdong9264.xyz/openwrt_v2ray.png)

take your phone and set a proxy

![openwrt_proxy](https://img.wangdongdong9264.xyz/openwrt_proxy.PNG)

## adguard

```sh

opkg install adguardhome

```

Status > System Log   search adguardhome in logs

you will seen 80, 53 port bind fail, bind 3000. open it `http://192.168.1.100:3000/`

change web and dns port that you haven't used. as 3000 and 3053

Network > DHCP and DNS > Forwards   DNS Forwards add value `192.168.1.100#3053`

save & apply

## other

[Firmware downloads](https://openwrt.org/toh/views/toh_fwdownload)

[v2raya document](https://v2raya.org/en/docs/prologue/installation/openwrt/)

[github AdGuardHome](https://github.com/AdguardTeam/AdGuardHome)

[adblockfilters](https://github.com/217heidai/adblockfilters)
