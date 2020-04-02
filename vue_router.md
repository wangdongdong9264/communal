# vue-router

## 作用

根据不同的路径映射到不同的视图

支持三种路由方式

  1. hash
  2. history
  3. abstract

提供了2种组件

  1. router-link
  2. router-view

#### 路由注册

todo: 1. vue插件的注册原理 2. 组册的流程

入口文件：/src/index.js

总结：

  1. vue编写插件的时候通常要提供静态的install方法
  2. vue-router的install方法会给每一个组件注入(Vue.mixin) beforeCreated和destoryed钩子函数
  3. 在 beforeCreated做一些私有属性定义和路由初始化工作

#### vueRouter对象

todo：1. vueRouter对象的属性和方法 2. 初始化逻辑

初始化逻辑：

  1. 路由初始化的时机是在组件的初始化阶段
  2. 执行到beforeCreated钩子函数时会执行router.init方法
  3. history.transitionTo方法做路由过渡

#### matcher

地址： src/create-matcher.js

todo： 1. createMatcher的初始化逻辑 2. match的匹配过程

reuter配置中有通配符`*` 会将它移动到最后

总结：

  1. createMatcher的初始化就是根据路由的配置描述创建映射表，包括路径/名称到路由record的映射关系
  2. match会根据传入的位置和路径计算出新位置，并比配到对应的路由record，然后根据新的位置和record创建新的路径并返回

#### 路径切换（导航守卫）

todo：

  1. 导航守卫的执行逻辑
  2. url的变化逻辑
  3. 组件渲染逻辑

  transitionTo方法 跳转执行的方法

  iterator 函数`src/history/base.js`逻辑：执行每一个导航守卫hook，并传入route，current，匿名函数，这三个参数分别对应官方文档中的to, from, next。执行匿名函数会根据一些条件执行abort或next，只有执行到next才会进到下一个导航守卫函数中

完整的导航解析流程 [官方地址](https://router.vuejs.org/zh/guide/advanced/navigation-guards.html#%E5%AE%8C%E6%95%B4%E7%9A%84%E5%AF%BC%E8%88%AA%E8%A7%A3%E6%9E%90%E6%B5%81%E7%A8%8B)


导航被触发。
在失活的组件里调用离开守卫。
调用全局的 beforeEach 守卫。
在重用的组件里调用 beforeRouteUpdate 守卫 (2.2+)。
在路由配置里调用 beforeEnter。
解析异步路由组件。
在被激活的组件里调用 beforeRouteEnter。
调用全局的 beforeResolve 守卫 (2.5+)。
导航被确认。
调用全局的 afterEach 钩子。
触发 DOM 更新。
用创建好的实例调用 beforeRouteEnter 守卫中传给 next 的回调函数。

---

url变化（hash模式）

源码位置：`src/history/hash.js`

监听路由变化

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

ensureSlash()方法 用来将`http://lcoalhost:8080`修改成`http://lcoalhost:8080/#/`

过程
