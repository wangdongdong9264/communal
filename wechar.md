# 开始微信小程序的开发

## 准备

1. 微信小程序开发者账号
2. 微信小程序开发工具

## 文件目录

1. *.wxml  页面文件
2. *.js    脚本文件
3. *.wxss  样式文件
4. *.json  配置文件

## 配置

[官方文档](https://mp.weixin.qq.com/debug/wxadoc/dev/framework/config.html)

## 应用和页面的生命周期

>应用生命周期

1. 用户首次打开小程序，触发onLaunch     全局只出发一次

2. 小程序初始化完成后，触发 onShow方法    监听小程序显示

3. 小程序从前台进入后台，触发onHide方法    在后台运行一段时间，或系统资源占用过高会被销毁

4. 小程序从后台进入前显示， 触发onShow方法

---

>页面的生命周期

1. 小程序注册完成后，加载页面，触发onLoad方法

2. 页面载入后触发onShow方法，显示页面

3. 页面初次渲染，会触发onReady方法，一个页面只会调用一次

4. 当页面跳转到其他页面或小程序后台时，触发onHide方法

5. 当页面重新载入或小程序从后到前台时，触发onShow方法

6. 当用重定向方法wx.redirectTo({})或关闭当前也返回上一页wx.navigateBack()时，触发onUnload方法

---

>应用生命周期影响页面的生命周期

1. 小程序初始化完成后，页面首次加载触发onLoand()只会触发一次

2. 当小程序进入到后台，先执行页面的onHide方法再执行应用的onHide方法

3. 当小程序从后台进入前台时，先执行应用的onShow方法再只执行页面的onShow方法

## 参数传递

```js

wx.nagigateTo({
    url:"../logs/logs?id=1"
})
```

```html

<navigator url="../logs/logs?id=100&title=标题">
</navigator>

```

>获取参数

```js
page({
    data:{
        ID:null
    },
    onLoad:function(options){
        console.log(options)
        this.setData({ID:options.id})
    }
})

```
