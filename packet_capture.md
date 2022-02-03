# 抓包

charles version 4.6.2
macOS version 12.2
iOS version 15.3
android version 12

## 前置

mac 上安装Charles证书

1. 打开Charles->Help->SSL Proxying->Install Charles Root Certificate
2. 会使用”钥匙串访问”安装（如果直接打开了 说明已经安装过 查看一下日期时间比较久建议重新安装）
3. 安装之后在”钥匙串访问”中找到Charles Proxy Custom Root Certificate
4. 选择”Get Info“->Trust->Always Trust

---

配置

配置ssl 打开Charles->Proxy->SSL Proxying Settings

选择通配符或者指定域名和端口

![SSL Proxying Settings](https://img.wangdongdong9264.xyz/charles_ssl_settings.png)

配置proxy 打开Charles->Proxy->Proxy Settings

![Proxy Settings](https://img.wangdongdong9264.xyz/charles_proxying_settings.png)

## ios

iphone上安装证书

1. 打开iPhone的无线局域网连接，连上和macOS相同的wifi
2. 配置代理地址为macOS的IP地址，端口号默认为8888
3. 打开Charles->Help->SSL Proxying->Install Charles Root Certificate on a Mobile Device
4. 在iPhone上访问`http://chls.pro/ssl`，按提示安装证书（safari浏览器）
5. 在iPhone上打开通用->关于本机->证书信任设置->开启对Charles证书的信任

---

ios模拟器抓包

1. 勾选Charles->Proxy->macOS Proxy
2. 打开Charles->Help->SSL Proxying->Install Charles Root Certificate in iOS Simulators
3. 进入ios模拟器 Settings->General->About->Certificate Trust Settings 开启对Charles证书的信任

## android

安全配置

  参考android官方配置（android 7及以上，7一下的版本没有安全限制）

  注意：这个只能抓取自己APP的包，无法抓取第三方APP

---

模拟器

  Android studio emulator 配置代理地址为macOS的IP地址，端口号默认为8888

  下载ca证书拖到模拟器

  进入Settings->Security->Encryption & credentials->Install a certificate

---

root

  只针对android 7及以上版本 原理就是将ca证书写入到系统文件

## 路由

tcpdump

```sh
opkg install tcpdump
```

![安装 tcpdump](https://img.wangdongdong9264.xyz/install_tcpdump.png)

```txt

-l：使标准输出变为缓冲行形式；
-c：抓包次数；
-nn：直接以 IP 及 Port Number 显示，而非主机名与服务名称；
-s ：< 数据包大小 & gt; 设置每个数据包的大小；
-i：指定监听的网络接口；
-r：从指定的文件中读取包；
-w：输出信息保存到指定文件；
-a：将网络地址和广播地址转变成名字；
-d：将匹配信息包的代码以人们能够理解的汇编格式给出；
-e：在输出行打印出数据链路层的头部信息；
-f：将外部的 Internet 地址以数字的形式打印出来；
-t：在输出的每一行不打印时间戳；
-v ：输出稍微详细的报文信息；--vv 则输出更详细信息

```

```sh
# 列出可以抓包的网络接口 any可用于抓取所有活动的网络接口的数据包
tcpdump -D

# 将抓取的数据包保存到文件 router.pcap 可用Wireshark查看
tcpdump -i any -c10 -nn -w router.pcap port 80

```

## 其它

[android 网络安全配置](https://developer.android.google.cn/training/articles/security-config.html)

[android emulator proxy](https://juejin.cn/post/6948987208497889317#heading-3)

[android root proxy](https://juejin.cn/post/6844903775086313480)

[tcpdump doc](https://www.tcpdump.org/manpages/tcpdump.1.html)