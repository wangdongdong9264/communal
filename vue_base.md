# vue 源码

## 版本

version 2.6.10

### src目录结构

  1. compiler  编译相关
  2. core 核心代码
  3. platforms 不同平台的支持 web/ hybrid
  4. server 服务端渲染
  5. sfc 解析'.vue'文件
  6. shared 公共的代码

### vue本质是个类/function

### 数据驱动

```js
this.message === this._data.message
```

#### `new Vue`发生了什么

  1. 源码位置 `src/core/instance/index.js`
  2. vue 初始化主要做了 `合并配置`, `初始化生命周期`, `初始化事件中心`, `初始化渲染`, `初始化data props computed watcher ...`
  3. 总结: new Vue > init > $mount > compile > render > VNode > patch > DOM

##### Vue实例挂载的实现 $mount

  1. compiler版本的`$mount`源码位置 `src/platform/web/entry-runtime-with-compiler.js`
  2. `$mount`方法对`el`参数做了限制， 不能在挂载在`html`, `body` 根元素上
  3. 在vue`2.x`中,所有vue的组件最终都需要render方法
  4. `render`方法。 如果没有定义render就会把`el`或`template`字符串转成render方法
  5. 转成render方法的过程是vue的一个`在线编译`的过程 调用`compileToFunctions`

  6. 原型上的$mount 在源码中`src/platform/web/runtime/index.js`
  7. `$mount`方法支持传入2个参数，第一个`el`表示挂载的元素，第二个`hydrating`和服务端渲染有关，浏览器环境下不需要传这个参数
  8. $mount实际上调用的是`mountComponent`方法. 源码位置 `src/core/instance/lifecycle.js`
  9. `mountComponent`方法的核心是 实例化一个`Watcher`， 在回调函数中调用`updateComponent`方法
  10. `Watcher` 在这里起到了两个作用 一是初始化执行回调，二是`vm`实例中监听数据变化执行回调

##### render

  1. `render`是一个私有方法(_render)， 用来把实例渲染成虚拟node. 源码位置 `src/core/instance/render.js`
  2. render函数中的`createElement`方法 就是 `vm.$createElement`
  3. 在`initRender`中 `vm._c`和`vm.$createElement`都调用 createElement方法
  4. `vm._c`方法是模版编译成render使用， `vm.$createElement`方法是用户手写render方法使用

##### Virtual DOM
  
  1. `Virtual DOM` 就是用原生的js对象去描述一个`DOM`节点. vue中的VNode使用`Class` 去描述的
  2. 源码位置 `src/core/vdom/vnode.js`
  3. VDOM 映射到真实的dom需要经历 VNode 的 create， diff，pathch 等等

##### createElement

  1. vue 用`createElement`方法创建VNode。 源码位置`src/core/vdom/create-elemenet.js`
  2. `createElement` 是对 `_createElement`方法的封装，允许调用的参数更加灵活
  3. `_createElement`方法有5个参数
    * `context` 表示VNode的上下文环境
    * `tag`表示标签 ， 字符串/`Component`
    * `data` 表示VNode的数据
    * `children` 表示当前VNode的子节点
    * `normalizationType` 表示子节点的规范类型
  
  4. `children` 的规范化
    * Virtual DOM 实际上是一个树状结构, 每一个VNode 可能会有若干个子节点，
    * 根据`normalizationType`值来规范 `children`, 分别是`normalizeChildren`，`simpleNormalizeChildren` 源码位置 `src/core/vdom/helpers/normalzie-children.js`
    * `simpleNormalizeChildren`方法是将`children`数组打平, 让children的深度自有1层
    * `normalizeChildren` 有两种应用方式。 一种是用户手写的render函数，会调用`createTextVNode`。 另一种是当编译`slot v-for`时，会调用`normalizeArrayChildren`
  
  5. `VNode` 的创建
    * 规范化`children` 后就去创建VNode实例

##### update

  1. `update` 是私有方法(_update), 调用的时机有两个，一个是首次渲染，另一个是数据更新 源码位置 `src/core/instance/lifecycle.js`
  2. `_update`方法就是把VNode渲染成真实DOM
  3. _update的核心是`vm.__patch__` 源码位置 `src/platforms/web/runtime/index.js`
  4. `Vue.prototype.__patch__` 在浏览器端 指向的是`patch`， 源码位置 `src/platforms/web/runtime/patch.js`
  5. `createPatchFunction` 接收两个参数  `modules` 定义了一些模块的钩子函数， `nodeOps` 封装了一系列dom操作的方法. 最终返回了一个`patch`方法
  6. `patch`方法 接收4个参数. `oldVnode`表示旧的VNode节点， `vnode`表示执行`_render`后返回的VNode节点，`hydrating`表示是否是服务端渲染，`removeOnly`是给`transition-group` 用的
