# vue-router

## 版本

version 3.1.5

## 作用

根据不同的路径映射到不同的视图

支持三种路由方式

  1. hash: 使用 URL hash 值来作路由。默认模式
  2. history: 依赖 HTML5 History API 和服务器配置
  3. abstract: 支持所有 JavaScript 运行环境，如 Node.js 服务器端

提供了2种组件

  1. router-link
  2. router-view

## 路由注册

todo: 1. vue插件的注册原理 2. 组册的流程

入口文件：/src/index.js

总结：

  1. vue编写插件的时候通常要提供静态的install方法
  2. vue-router的install方法会给每一个组件注入(Vue.mixin) beforeCreated和destoryed钩子函数
  3. 在 beforeCreated做一些私有属性定义和路由初始化工作

## vueRouter对象

todo：1. vueRouter对象的属性和方法 2. 初始化逻辑

初始化逻辑：

  1. 路由初始化的时机是在组件的初始化阶段
  2. 执行到beforeCreated钩子函数时会执行router.init方法
  3. history.transitionTo方法做路由过渡

## matcher

地址： src/create-matcher.js

todo： 1. createMatcher的初始化逻辑 2. match的匹配过程

reuter配置中有通配符`*` 会将它移动到最后

总结：

  1. createMatcher的初始化就是根据路由的配置描述创建映射表，包括路径/名称到路由record的映射关系
  2. match会根据传入的位置和路径计算出新位置，并比配到对应的路由record，然后根据新的位置和record创建新的路径并返回

## 路径切换（导航守卫）

todo：

  1. 导航守卫的执行逻辑
  2. url的变化逻辑
  3. 组件渲染逻辑

  transitionTo方法 跳转执行的方法

  iterator 函数`src/history/base.js`逻辑：执行每一个导航守卫hook，并传入route，current，匿名函数，这三个参数分别对应官方文档中的to, from, next。执行匿名函数会根据一些条件执行abort或next，只有执行到next才会进到下一个导航守卫函数中

完整的导航解析流程 [官方地址](https://router.vuejs.org/zh/guide/advanced/navigation-guards.html#%E5%AE%8C%E6%95%B4%E7%9A%84%E5%AF%BC%E8%88%AA%E8%A7%A3%E6%9E%90%E6%B5%81%E7%A8%8B)


1. 导航被触发。
2. 在失活的组件里调用离开守卫。
3. 调用全局的 beforeEach 守卫。
4. 在重用的组件里调用 beforeRouteUpdate 守卫 (2.2+)。
5. 在路由配置里调用 beforeEnter。
6. 解析异步路由组件。
7. 在被激活的组件里调用 beforeRouteEnter。
8. 调用全局的 beforeResolve 守卫 (2.5+)。
9. 导航被确认。
10. 调用全局的 afterEach 钩子。
11. 触发 DOM 更新。
12. 用创建好的实例调用 beforeRouteEnter 守卫中传给 next 的回调函数。

---

## url变化（hash模式）

源码位置：`src/history/hash.js`

监听路由变化 `popstate` / `hashchange`

```js
window.addEventListener(
  supportsPushState ? 'popstate' : 'hashchange',
  () => {
    const current = this.current
    if (!ensureSlash()) {
      return
    }
    this.transitionTo(getHash(), route => {
      if (supportsScroll) {
        handleScroll(this.router, route, current, true)
      }
      if (!supportsPushState) {
        replaceHash(route.fullPath)
      }
    })
  }
)
```

哈希模式下`http://lcoalhost:8080`变成`http://lcoalhost:8080/#/`

原因：实例化`HashHistory`时会执行`ensureSlash()`方法

过程:

  1. ensureSlash() 此时url为`http://lcoalhost:8080`
  2. ensureSlash的path这时候为空 内部进入replaceHash('/' + path) 此时url为`http://lcoalhost:8080`
  3. 哈希模式所以supportsPushState为false 进入getUrl() 此时url为`http://lcoalhost:8080`
  4.  window.location.replace() 这时url为`http://lcoalhost:8080/#/`


## `router-view`组件

源码位置： src/components/view.js

todo:
  1. router-view如何知道渲染什么组件

在install（src/install.js）方法注册 `RouterView`和`RouterLink`组件

RouterView是一个函数式组件

this.$route 实际上是访问到 `this._router.history.current`

路由切换的核心 `Vue.util.defineReactive(this, '_route', this._router.history.current)`

`this.$route`是响应式的, router-view在执行render函数会访问`$route`，然后触发`this._router`的get

 `history.transitionTo`结束后（路径发生变化）， 变化后就会进行`app._route`的赋值（触发set 》 重新渲染）


## `router-link`组件

位置：`src/components/link.js`

todo:
  1. router-link如何变成<a>标签
  2. 点击时如何做路径切换

通过 `router.resolve`计算出新路径
处理class 优先级：当前传入的class 》全局 》默认
  * globalActiveClass == null ? 'router-link-active' : globalActiveClass
  * globalExactActiveClass == null ? 'router-link-exact-active' : globalExactActiveClass
  * this.activeClass == null ? activeClassFallback : this.activeClass
  * this.exactActiveClass == null ? exactActiveClassFallback : this.exactActiveClass
处理事件，默认点击事件click
处理标签
  1. 如果是a标签 直接赋值href
  2. 如果不是就通过`findAnchor`方法递归找子节点的a标签
    * 找不到就不会赋值href（因为没啥意义）
  3. 渲染a标签

点击router-link时会执行`handler`方法
通过guardEvent()进行一层过滤
  1. 不能使用控制键重定向
  2. 不要在调用preventDefault时重定向
  3. 不要右键单击重定向
  4. 如果`target =“ _ blank”`不要重定向
  5. e.preventDefault()
replace参数 ? router.replace() :  router.push()


## 总结

路由始终会维护当前的线路，路由切换的时候会把当前线路切换到目标线路，切换过程中会执行一系列的导航守卫钩子函数，会更改url，也会渲染对应的组件，切换完毕后会把目标线路替换当前线路，这样就会作为下一次切换路径的依据
