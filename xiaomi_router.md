# 小米路由器3G 安装 OpenWrt

## 准备

1. 升级路由器固件为开发版

[官方下载地址](http://www1.miwifi.com/miwifi_download.html)

在页面上方位置选择ROM并在下拉菜单中找到并下载适合自己路由器型号的开发版ROM文件

2. 开启ssh

[官方工具包下载地址](http://d.miwifi.com/rom/ssh)

下载对应对应路由器的工具包，然后根据小米下附指引进行安装。安装完成后，SSH开关便会打开

## 开始

创建目录/下载文件/安装

```sh
mkdir -p /userdisk/dongdong/opt # dongdong/ 是我创建的目录
mount -o bind /userdisk/dongdong/opt /opt

cd /userdisk/dongdong/
wget http://pkg.entware.net/binaries/mipsel/installer/installer.sh

chmod +x installer.sh
./installer.sh

```

## 使用

```sh

export PATH=/opt/sbin:/opt/bin:$PATH
opkg update
opkg install git # 测试一下

```

## 设置环境变量

编辑 `/etc/profile`

```txt

export PATH=/opt/sbin:/opt/bin:$PATH

```

不设置的话(不会吧 不会吧 不会真有人不设置环境变量吧) 重启后运行时找不到软件`-ash: opkg: not found`

## 开机自启动

编辑 `/etc/rc.local`

```txt

mount -o bind /userdisk/dongdong/opt /opt

```

在`exit 0`之前加入

不设置的话 重启后用opkg安装的软件不能正常运行

## 其它

[OpenWrt](https://openwrt.org/zh/start)

[Entware-ng](https://github.com/Entware/Entware-ng)
