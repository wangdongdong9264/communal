# vue-ssr

## build/webpack.config.server.js

node 打包配置

```js

externals: Object.keys(require('../package.json').dependencies)

```

产生单独的文件，不需要打包的文件

  1. 因为node是可以require的，没有必要把依赖放在output的一个文件中
  2. 避免错误，打包生成的代码有vue，node_modules也有一份vue, 两份环境不一致

作用： 减少内存浪费

---

.styl css预处理

替换掉vue-style-loader 这个会以dom插入的形式来， node没有document

---

'vue-server-renderer/server-plugin'

作用：打包不会有js文件输出的，输出的是json文件，这个json文件可以通过vue-server-renderer做很多服务端渲染的事
默认输出的是vue-ssr-server-bundle.json， 可以自定义

```js
new VueServerPlugin({
  filename: 'my-server-bundle.json'
})
```

## build/webpack.config.client.js

vue打包配置

'vue-server-renderer/client-plugin'
作用：生成打包后的资源路径
默认输出：vue-ssr-client-manifest.json
自定义名称：同vue-server-renderer/server-plugin

## server/routers/dev-ssr.js 和 server/routers/ssr.js

serverCompiler.watch的回调中eslint的错误在stats里 不在err

---

vue-server-renderer 生成的内容只是body里面的html 这里使用ejs模版引擎

---

通过 vue-server-renderer.createBundleRenderer 生成一个带有<scrpt>标签的js文件引用字符串
参数： inject: false [手动注入资源](https://ssr.vuejs.org/zh/guide/build-config.html#manual-asset-injection)

问题：webpack-dev-serve / node 是2个进程 没有办法直接通过node代码来获取另外一个serve的东西
解决方法：通过axios.get来请求这个文件（webpack打包后的资源路径vue-ssr-client-manifest.json）

---

优化：
  memory-fs webpack读取文件/编译文件/输出文件 如果都是从磁盘上操作效率比较低

  在正式环境中 产生的renderer是不会变的 vue-ssr-server-bundle.json/vue-ssr-client-manifest.json 两个参数都不变

## server/routers/server-render.js

渲染

renderer.renderToString(context)
作用：将 Vue 实例渲染为字符串， 返回一个 Promise 对象，在其 resolve 后返回最终渲染的 HTML。

通过ejs.render将数据绑定

## client/create-app.js

todo：服务端渲染每次都要渲染新的app 不能用上次渲染过的app对象，再次渲染下一次的app，因为这次app对象会包含上次渲染的状态，会影响下一次的渲染内容，所以每一次都会渲染新的app

有点类似index.js(单页面的)

初始化的内容全都放在这(vue,vuex,vue-router,vuexConfig/routerConfig,全局样式,组件等)

每次调用都初始化一遍vue,vuex... 否则会在node端造成内存溢出

mate信息在这处理 子组件的meteInfo高于父组件

## client/server-entry.js

返回一个new Promise，让vue-server-renderer知道什么时候异步结束

context参数：
  等于server/routers/server-render.js 传入的context （在渲染中vue也会给它赋值）

`router.push(context.url)`:
  在服务端app，router，store还只是对象，还没到渲染这一步(浏览器端是有默认路由的)
  主动调用router.push，才会执行代码，匹配到要调用的组件

router.onReady

  todo：组件加载完，处理数据
  通过context.meta的方式 将client/create-app.js的meta传给server/routers/server-render.js

## client/client-entry.js

做服务端渲染，需要客户端做相应的配合，依赖于`client/create-app.js`

### 问题

注意文件utf-8 在读取文件的时候

---

（开发环境中）ssr渲染成功了，查看源码页面也引入了js，但是报请求错误
原因：跨域
过程：所有的请求都会在dev-ssr.js的handleSSR中处理，handleSSR会把路径传给server-entry.js，执行router.push(context.url)，router中又没有静态资源，所以才导致的请求错误
解决方法：

  1. 在node中起个代理（打包环境只能这个）
  2. 在build/webpack.config.base.js中，将`output.publicPath: '/public/'` 改成 `output.publicPath: 'http://127.0.0.1:webpack开发端口/public/'`

### 总结

  2个入口分别对应node和浏览器端

* 客户端vue实例化后需要执行挂载dom

* 服务端只需要生成vue对象

---

ssr主要优势在于更好的seo和更快的到达时间，服务端返回的内容是具有信息的html文档对搜索引擎的爬虫是友好的。用户在弱网的情况下不用等待js加载才开始渲染页面，可以更快的看到完整内容

缺点：

1. 需要编写通用型组件，保证在两端都能正常使用（window/document/特定的钩子函数）
2. 比大部分动态网站要消耗更多cpu资源
