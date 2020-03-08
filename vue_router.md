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
