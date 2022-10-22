# h5 app 小程序 互相跳转打开方式

## app或小程序 打开h5

1. webview

## app打开小程序

1. 微信开发平台sdk
  
* 需要已认证的的微信开放平台账号
* app接入开放平台的opensdk
* 可跳转任意小程序
* 跳转自家小程序不受影响
* 跳转别的小程序需要先将app和小程序关联，最多关联3个

## 小程序打开app

1. app打开小程序后再跳回

* 小程序不能直接打开app，只有跳回原app的能力
* 两种场景：app分享微信卡片，点击微信卡片可以打开小程序 / app直接打开小程序。这两种场景下小程序可以返回app
* 只能手动点击页面标签跳转

[官方文档](https://developers.weixin.qq.com/miniprogram/dev/framework/open-ability/launchApp.html)

## 微信内webview打开小程序

1. 开放标签 `wx-open-launch-weapp`

* 认证的开发平台账号
* 公众号后台绑定h5安全域名
* h5引入微信js-sdk，配置wx.config,使用标签
* 只能手动点击标签跳转
* 可跳转任意小程序

[官方文档](https://developers.weixin.qq.com/doc/offiaccount/OA_Web_Apps/Wechat_Open_Tag.html#21)

2. 小程序码

* 微信公众平台账号
* 需要后端对接小程序api生成小程序码
* 前端展示小程序码，引导用户长按识别
* 只能跳转自家的小程序
* scene参数有限制

[官方文档](https://developers.weixin.qq.com/miniprogram/dev/api-backend/open-api/qr-code/wxacode.getUnlimited.html)

## 浏览器环境打开小程序

1. 小程序 URL Scheme

* 有效期最长30天
* 只能被一个用户访问
* 每天生成 URL Scheme 和 URL Link 总数量上限为50万

[官方文档](https://developers.weixin.qq.com/miniprogram/dev/framework/open-ability/url-scheme.html)

2. 小程序码（同上）

3. 云开发静态托管h5

[官方文档](https://developers.weixin.qq.com/miniprogram/dev/wxcloud/guide/staticstorage/jump-miniprogram.html)

## 小程序webview打开app

微信的webView屏蔽了URL Scheme，除非你是白名单，例如腾讯系app，知乎，bilibili等

1. 开放标签 `wx-open-launch-app`

* 微信公众平台和微信开放平台账号
* 公众平台绑定h5安全域名
* 在开放平台绑定h5域名和app的绑定关系
* h5引入微信js-sdk，配置wx.config,使用标签
* 只能手动点击标签跳转
* 只能跳转绑定的app
* 可以实现跳转指定页面和携带参数

[官方介绍](https://developers.weixin.qq.com/doc/oplatform/Mobile_App/WeChat_H5_Launch_APP.html)

[wx-open-launch-app 说明](https://developers.weixin.qq.com/doc/offiaccount/OA_Web_Apps/Wechat_Open_Tag.html#22)

2. 右上角提示用户用浏览器打开

## 浏览器打开app

1. URL Scheme

* android / ios 都支持

2. Universal Links

* 只有ios9+才支持
* 需要一个https域名做Universal Links链接
* ios需要激活 `Associated Domains`，并配置`apple-app-site-association`文件上传到https域名服务器目录
