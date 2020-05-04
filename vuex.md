# vuex

## 版本

version 3.1.3

## 基本

专门为vue开发的状态管理模式。
采用集中式存储管理应用的所有组件的状态

使用`rollup`打包

入口文件: `/src/index.js`

## 初始化

todo:
  1. vuex的安装过程
  2. Store的实例化过程

### 安装

当执行`Vue.use(vuex)`时，执行vuex的install方法 位置：`src/store.js`

`applyMixin`方法 先判断版本

```js
if (version >= 2) {
   Vue.mixin({ beforeCreate: vuexInit })
 } else {
   // ...
 }
```

`vuexInit`方法 作用就是把`options.store`保存在所有组件的 `this.$store`中 位置：`src/mixin.js`
options.store来源于new vue({ store }), 如果不是根组件 会往父组件上找

### new Store

```js

this._actions = Object.create(null) // acton
this._mutations = Object.create(null) // mutation
this._wrappedGetters = Object.create(null) // getter
this._modules = new ModuleCollection(options) // module

```

```js

// store的上下文指的是Store
// bind commit and dispatch to self
const store = this
const { dispatch, commit } = this
this.dispatch = function boundDispatch (type, payload) {
  return dispatch.call(store, type, payload)
}
this.commit = function boundCommit (type, payload, options) {
  return commit.call(store, type, payload, options)
}
```

installModule() 作用：初始化`_actions/_mutations/_wrappedGetters_modules`

resetStoreVM() 作用：建立依赖关系，变成响应式

### ModuleCollection

位置：`src/module/module-coolection.js`

new ModuleCollection(options) 的 option指的是new Vuex.Store({...}）中定义的对象即`rootModule`

this.register方法 runtime参数是用于动态注册

```js
// 如果有modules 递归执行 this.register
// register nested modules
if (rawModule.modules) {
  forEachValue(rawModule.modules, (rawChildModule, key) => {
    this.register(path.concat(key), rawChildModule, runtime)
  })
}

```

通过`this.register`建立树状结构

`new Module`类

  位置：src/module/module.js

  `this._children` 保存的子module

### installModule

位置：`src/store.js`

`makeLocalContext`函数
  参数：
    1. store: root store
    2. namespace: 模块的命名空间
    3. path: 模块的path

  作用：
    1. 定义了local对象
    2. 对于`dispatch` 和 `commit` 方法，如果没有 `namespace`, 他们就直接指向`root store` 的dispatch/commit
    3. 如果存在namespace 则会创建方法，把type自动拼接上`namespace` 然后执行 store 上对应的方法


  getters: 没有namespace就直接返回 root storede的getters 否则返回`makeLocalGetters`方法

  state: 通过`getNestedState`方法 从 root state 开始，通过 path.reduce 方法一层层查找子模块 state，最终找到目标模块的 state

  ```js
  Object.defineProperties(local, {
    getters: {
      get: noNamespace
        ? () => store.getters
        : () => makeLocalGetters(store, namespace)
    },
    state: {
      get: () => getNestedState(store.state, path)
    }
  })
  ```

`makeLocalGetters`函数

  参数:
    1. store: root store
    2. namespace: 模块的命名空间

  过程:

    1. 首先获取了 namespace 的长度
    2. forEach 遍历 root store 的 getters `Object.keys(store.getters).forEach(type => { ... })`
    3. 先判断type是否匹配 namespace
    4. 只有匹配的时候才从 namespace.length 的位置截取 得到`localType`
    5. 接着用 Object.defineProperty 定义 `gettersProxy` 获取 localType (实际上是获取 `store.getters[type]` )


`getNestedState`函数  path.reduce查找子模块 最终找到目标模块

  ```js

  path.reduce((state, key) => state[key], state)

  ```

遍历模块中子模块（modules），然后递归执行`installModule`

`resetStoreVM`函数

    参数：
      1. this
      2. state

    作用：
      1. 建立 `getters` 和 `state`的联系, 本质上getters依赖state
      2. 利用了 Vue 中用 `computed` 计算属性来实现

```js

store._vm = new Vue({
  data: {
    $$state: state
  },
  computed
})


get state () {
   return this._vm._data.$$state
 }

```

当我们访问 store.state 时 实际上访问的 `this._vm._data.$$state`

## 总结

  store 就是是一个数据仓库，为了方便的管理仓库，vuex把一个大的store拆成一些modules(一个树形结构)。每个module分别定义了`state`, `getters`, `mutations`, `actions`。
  vuex通过递归遍历module的方式完成了初始化

## 其它

```js

this._committing = true
// store._commiting = true
// store.state.xxx = xxxx
```

将`_commiting`修改`true`就可以进行外部修改 不用`commit()`方法（不推荐 这只是一个hack写法）
