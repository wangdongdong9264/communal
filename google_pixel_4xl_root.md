# google pixel 4xl 开启 motion sense

## 解锁bootloader

平台：mac

magisk版本：22.1

默认你已经安装好了`platform-tools`

### 解锁OEM

1. 设置-关于手机-版本号（连按七下 打开开发者选项）
2. 设置-系统-高级-开发者选项-`OEM解锁`开启
3. 设置-系统-高级-开发者选项-`USB调试`开启

### 解锁bl

1. 按住电源键，选择重启（这时候可以松开电源键），然后按住音量减， 进入bl界面
2. 连接USB
3. 输入下面命令

```shell
# 检查fastboot连接
fastboot devices
# 正常情况下会显示设备序列号

```

```shell
# 解锁bl
fastboot flashing unlock
# 正常情况下 手机上出现一个操作界面，要求你确认此操作
# 使用音量键选择（Unlock the bootloader）
# 按电源键确认
```

```shell

# 重启手机
fastboot reboot
# 这时候手机上的所有数据会被清除重置
# 设置-系统-高级-开发者选项-OEM解锁（打开状态并且无法修改）

```

别忘了重新开启`开发者选项`和`USB调试`

## 刷入Magisk/root

### 准备

1. 下载镜像包

  设置-关于手机-版本号（查看当前手机的版本号）

  打开[pixel 镜像地址](https://developers.google.com/android/images) 下载对应机器和版本匹配的镜像

  解压镜像文件，找到后缀`.zip`的文件再解压，找到boot.img

2. 下载Magisk Manager并安装

  [下载地址](https://github.com/topjohnwu/Magisk/releases)
  
3. 将boot.img移动到手机上

### 修补boot.img

点击第一行的安装 选择`选择修补一个文件` 选择刚传入手机的`boot.img`

然后等待完成 （完成后会生成magisk_patched-xxx.img文件） 将文件导入电脑

### root

```shell

fastboot flash boot /youFilePath/magisk_patched-xxx.img

```

```shell

fastboot reboot
# 重启

```

重启后如果没有Magisk 就再重新安装一下

root后记得关闭系统自动更新 设置-系统-开发者选项-系统自动更新（关闭）

## 开启 motion sense

```shell

# 去除motion sense限制
adb shell
su root
setprop pixel.oslo.allowed_override 1
setprop persist.pixel.oslo.allowed_override 1
setprop ctl.restart zygote

```

设置-系统-`Motion Sense`（开启）

## 其它

root后如何ota升级的问题

谷歌在每个月的月初会推送系统更新，更新的时候会检测`system`分区是否完整，如国被修改，会导致ota失败，手机可能变砖。

1. 打开Magisk-卸载-还原原厂镜像
2. 然后再ota更新 安装完成后不要点重启
3. 打开Magisk-第一行的安装-安装到未使用的槽位 执行完成后重启

## unRoot

```shell

fastboot --slot=all flash bootloader /youFilePath/bootloader-coral-c2f2-0.3-7062597.img

fastboot reboot bootloader

fastboot --solt=all flash radio /youFilePath/radio-coral-g8150-00082-210106-b-7065218.img

fastboot reboot bootloader

fastboot --skip-reboot --slot=all update /youFilePath/image-coral-rq2a.210405.005.zip

```

音量键选择`enter recovery`开机键进入 再选择`wipe date/factory reast` 继续选择`Factory data reset`

等待 显示屏下面出现 `data wipe complete`

选择`reboot system now`


```shell

# 在上述操作弄完后 记得上锁
fastboot flashing lock

```

---

如果你之前已经刷入`Magisk`过， 只需要打开`Magisk`-卸载-还原原厂镜像，然后再点击上方的重启图标（设置旁边）-重启
