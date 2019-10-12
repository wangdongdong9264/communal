# 树莓派

```sh
sudo apt-get install tightvncserver

```

设置密码

```sh
vncpasswd

```

启动

```sh
tightvncserver :1

```

关闭

```sh
tightvncserver -kill :1
```

## mac

youRaspberryIp:1

```txt
K58FR-VU2C5-KWMNA-MZLJ5-29USA

N5QKQ-QEVER-BUFNB-QZK5D-EMF9A

BRDCD-AXM92-XDK2K-YXLPY-HHXYA
```

特殊的0号控制台——0号控制台就是连接真实显示器真正输出图像的那个桌面。对于VNC客户端，不输入端口号登录，默认就登录到0号控制台，方便。但是因为0号是真正的桌面，所以和开机启动桌面环境存在冲突。
