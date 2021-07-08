# adb 黑域

1. 进入 platform-tools文件夹

`.\adb devices` 检查链接是否成功

`.\adb -d shell sh /data/data/me.piebridge.brevent/brevent.sh` 启动服务

--<!-- markdownlint-capture -->

## 无线调试

前提：

1. android 11以上的设备
2. android SDK版本大于30.x
3. 同一wifi网络

```sh

adb --version # 查看版本信息

```

准备：

1. 启用`开发者选项`
2. 启用`无线调试`
3. 无线调试 》使用配对码配对设备 （端口和配对码每次都会变）

启用：

终端上运行`adb pair ip:port`

```sh

# 例如
adb pair 192.168.31.180:42879

# 接着会让你输入配对码
# 查看连接设备
adb devices

```
