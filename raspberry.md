# 树莓派的相关配置

> etc/apt/sources.list

```sh
deb http://mirrors.aliyun.com/raspbian/raspbian/ wheezy main non-free contrib
deb-src http://mirrors.aliyun.com/raspbian/raspbian/ wheezy main non-free contrib
```

## 扩展swap

```sh
sudo apt-get install dphys-swapfile
```

## fcitx输入中文时 不显示候选词

1. 卸载 fcitx-module-kimpanel

    ```sh
    sudo apt remove fcitx-module-kimpanel
    ```

2. 重启

## nano编辑器

1. 打开或新建一个文件

    ```sh
    nano <filename>
    ```

2. 保存和退出

    ```txt
    Ctrl + O // 输入或修改文件名 然后按Enter

    Ctrl + X // 退出
    ```

3. 搜索

```txt
Ctrl + W // 输入字符串 然后Enter
```

## respberry 没有声音

```sh
sudo raspi-config

// 找到Advanced options, 进入Audio设置，选择force 3.5mm ('headphone')

```

## ubuntu 使用彩色控制台

```sh
nano ~/.bashrc

// 把#force_color_prompt=yes 的'#'号去掉
```

## 修改GPU内存 重启后可能会进入终端

```sh
swichdesk GNOME


startx

```

## raspi-config 设置

[教程 http://www.cnblogs.com/xy888/p/5479552.html](http://www.cnblogs.com/xy888/p/5479552.html)

## 搭建web服务器

[教程 http://wiki.jikexueyuan.com/project/raspberry-pi/web.html](http://wiki.jikexueyuan.com/project/raspberry-pi/web.html)

> apache + mysql + php

```sh
sudo apt-get install apache2

sudo apt-get install mysql-server // 安装过程中会提示你输入一个密码，是mysql root用户的密码

sudo apt-get install php
sudo apt-get install php-mysql

```

1. Apache 默认路径是/var/www/
2. 其配置文件路径为/etc/apache2/
3. 可以通过sudo vi /etc/apache2/ports.conf修改监听端口号
4. 重启服务生效sudo service apache2 restart

> sudo /etc/init.d/apache2 start //start server
> sudo /etc/init.d/apache2 restart //restart server
> sudo /etc/init.d/apache2 stop //stop server

---

## install git

```sh
sudo apt-get install git

```

## install node

```sh
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -

sudo apt install nodejs

```

## get cpu thermal

```sh
cd /sys/class/thermal/thermal_zone0

cat temp

```

## install Geany IDE

```sh
sudo apt-get install geany

geany // start
```

## install epiphany-browser

```sh
sudo apt-get install epiphany-brower

epiphany // start
```

## 安装 vim-gtk

* vim-gtk // 普通
* vim-athena // 绚丽
* vim-gnome // 不推荐

---

## 花生壳 内网映射

1. 下载花生壳 https://hsk.oray.com/download/

2. 安装

    ```sh
    sudo dpkg -i phddns_rapi_x.x.x.armhf.deb
    ```

3. 设置 https://b.oray.com/

    * 内网主机 就是你数莓派的ip
    * 内网端口 我装的是apache2 监听的端口在/etc/apache2/ports.conf这里查看
    * 外网端口 选择临时端口号

4. 重启 花生壳

    ```sh
    phddns start
    ```

5. 花生壳日志文件

  ```sh
  cd /var/log/phddns/
  ```

## other

[raspberry pi 数码显示管](http://shumeipai.nxez.com/2014/10/12/raspberry-pi-drive-four-digital-tube-display-time.html)

## raspberry pi

[blog for raspberry pi](http://thejackalofjavascript.com)
