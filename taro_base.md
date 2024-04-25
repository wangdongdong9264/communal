# taro 源码

## 版本

version 3.6.7

### packages 主要目录结构

1. taro
2. taro-api
3. taro-cli
4. taro-components
5. taro-extend
6. taro-helper
7. taro-loader
8. taro-mini-runner
9. taro-react
10. taro-router
11. taro-runner-utils
12. taro-runtime
13. taro-service
14. taro-utils
15. taro-webpack-runner
16. taro-with-weapp

### tarojs/taro

入口文件`packages/taro/index.js`

```js

// 兼容import
if (hooks.isExist('initNativeApi')) {
  // 初始化 用于对应平台的原生api
  hooks.call('initNativeApi', taro)
}

```

微信小程序的`initNativeApi` 在`packages/taro-weapp/src/apis.ts`

```ts
export function initNativeApi (taro) {
  processApis(taro, wx, {
    needPromiseApis,
    modifyApis (apis) {
      // fix https://github.com/NervJS/taro/issues/9899
      apis.delete('lanDebug')
    },
    transformMeta (api: string, options: Record<string, any>) {
      if (api === 'showShareMenu') {
        options.menus = options.showShareItems?.map(item => item === 'wechatFriends' ? 'shareAppMessage' : item === 'wechatMoment' ? 'shareTimeline' : item)
      }

      return {
        key: api,
        options
      }
    }
  })
  taro.cloud = wx.cloud
  taro.getTabBar = function (pageCtx) {
    if (typeof pageCtx?.getTabBar === 'function') {
      return pageCtx.getTabBar()?.$taroInstances
    }
  }
  taro.getRenderer = function (){
    return taro.getCurrentInstance()?.page?.renderer ?? 'webview'
  }
}

```

总的来说`initNativeApi` 所做的事情是将微信的api进行二次封装，然后挂载在taro对象下，开发调用taro的api即是调用微信官方的api

`processApis`分析 位置`packages/shared/src/native-apis.ts`

`_needPromiseApis` 没有返回promise的异步事件 taro会把这些事件使用promise进行二次封装

```ts

// 对于微信不支持的方法返回一个警告 小程序暂不支持 xxx
if (!global.hasOwnProperty(platformKey)) {
  taro[key] = nonsupport(key)
  return
}

```
