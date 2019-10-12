# 树莓派 zero w

1. 安装 烧录 （省略）

2. 通过 usb 连接

    * 打开烧录的文件夹

    * 修改 `config.txt` 末行处换行添加

        ```txt
            dtoverlay=dwc2
        ```

    * 修改 `cmdline.txt` 找到rootwait字段，并在其后面空格添加

        ```txt
            modules-load=dwc2,g_ether
        ```

    * 添加 `ssh` 文件，在烧录文件的根目录

    * 本机连接raspberry

        ```sh
            ssh pi@raspberrypi.local
        ```

3. 修改 `wpa_supplicant.conf`

    * wifi 配置

        ```sh

            sudo nano /etc/wpa_supplicant/wpa_supplicant.conf

            #添加
            #network={
            #ssid="YouWifiName"
            #psk="YouWifiPassword"
            #scan_ssid=1
            #}

        ```

## 其它

```sh

    sudo halt #关机

    sudo reboot #重启

```

```sh

    #SD Card Formatter进行格式化SD卡

    diskutil list  # 查看驱动器列表 获取设备的路径 /dev/disk2

    diskutil unmountDisk YouEquipmentPath  # 取消挂载

    sudo dd if=YouImgPath of=YouEquipmentPath bs=1m;sync  # 开始烧录

    # 等待烧录

    diskutil eject YouEquipmentPath  # 推出设备

```
