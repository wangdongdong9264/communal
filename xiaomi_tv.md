# 小米电视安装浏览器

## 电视

### 设备安全设置

    设置--账号与安全--允许安装未知来源的应用--允许ADB调试

### 开启开发者模式

    设置--关于--产品型号--遥控连续按5下OK键

### 查看网络IP

    设置--网络--找到电视使用的局域网 IP

## 电脑

### 连接小米电视

```sh

adb connect 192.168.31.46

```

### 查看已连接的设备

```sh

adb devices

```

### 安装软件

```sh

adb install  ./Path.apk

```

## 其它

```sh

# 前目录的某件到电视的download文件夹下

adb push ./path.file /mnt/sdcard/Download/

```
