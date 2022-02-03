# 微信x5内核页面调试

本次使用的环境

硬件：华为p30

软件：

* HarmonyOS 2.0.0.209
* wechat 8.0.16
* chrome 96.0.4664.55

## 准备

1. android
2. 数据线
3. chrome
4. vpn（chrome devtool）

## 步骤

### tbs安装

[tbs安装地址: http://debugtbs.qq.com](http://debugtbs.qq.com)

选择`安装线上内核`，按提示进行，最后点击重启。

![图片](http://img.wangdongdong9264.xyz/Wechat_tbs.jpeg)

### x5 debug 配置

[x5debug配置地址: http://debugx5.qq.com](http://debugx5.qq.com)

勾选`打开TBS内核Inspector调试功能`，`打开TBS内核X5jscore Inspector调试功能`, `打开vConsole调试功能`这三个选项

![图片](http://img.wangdongdong9264.xyz/Wechat_config.jpeg)

### chrome devtool

1. 勾选` Discover USB devices`

![图片](http://img.wangdongdong9264.xyz/devtool_before.png)

2. 用手机微信访问需要调试的页面，在`devtool`就可以看到当前手机访问的页面

![图片](http://img.wangdongdong9264.xyz/devtool_after.png)

3. 开启vpn，在`devtool`点击对应网址的`inspect`

![图片](http://img.wangdongdong9264.xyz/devtool_inspect.png)

## 其它

[tbs 调试指南 https://x5.tencent.com/tbs/guide/debug/faq.html](https://x5.tencent.com/tbs/guide/debug/faq.html)

不使用vpn则会出现`HTTP/1.1 404 Not Found`，因为`devtool`的inspect需要加载`https://chrome-devtools-frontend.appspot.com`上的资源，所以需要科学上网

`paly store`和`app store`的微信走的是系统内核, 浏览器啥样,微信里也一样

[X5 浏览器内核调研报告](https://juejin.cn/post/6844903535004352520#heading-25)
