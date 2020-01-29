# vue 响应式原理

## 核心

利用了 `ES5` 的 `Object.defineProperty`

```js
Object.defineProperty(obj, prop, descriptor)
```

参数
  obj 要在其上定义属性的对象
  prop 要定义或修改的属性的名称
  descriptor 将被定义或修改的属性描述符

返回值
  被传递给函数的对象

##### initState

vue 在初始化阶段， `_init`方法执行的时候，回执行`initState(vm)`方法，定义在`src/core/instance/state.js`

重点在 initProps, initData

  1. initProps 方法
  初始化的主要过程, 遍历定义的`propsOptions`参数
  遍历的过程主要做了两件事
    * 调用 `defineReactive`方法将每个`prop` 变成响应式（可以通过vm._props.xxx 访问props中的对应的属性）
    * 通过 `proxy` 方法把 `vm._props.xxx` 的访问代理到 `vm.xxx`

  2. initData 方法
  初始化过程和Props类似
    * 对定义的`data` 函数返回对象的遍历，通过 `proxy` 方法把 `vm._data.xxx` 的访问代理到 `vm.xxx` 上
    *  调用`observe` 方法 观测整个`data` 的变化，将data也变成响应式

##### proxy

proxy (代理)的作用是把`props`和`data`上的属性代理到`vm` 实例上

`proxy`方法通过`Object.defineProperty`把`target[sourceKey][key]`的 get/set 变成对`target[key]`

###### observe

observe的功能是检测数据的变化， 位置在`src/core/observer/index.js`
`observe`作用是给非`VNode`的对象类型添加一个`Observer`, 如果已经添加过则直接返回，否则在满足一定条件去实例化一个`Observer`对象实例

##### Observer


### 总结

  1. 响应式对象核心是利用`Object.defineProperty`给对象的属性添加getter/setter
  2. vue会把props/data 变成响应式对象，在创建过程中，发现了子属性也为对象则递归把该对象变成响应式


## 依赖收集

todo 1. 什么是依赖收集 2. 依赖收集的流程 3. 依赖收集的目的

使用观察者模式 1对多

依赖收集就是订阅数据变化的watcher的收集

目的： 是为了当这些响应式数据发生变化，触发他们的setter时，能知道应该通知那些订阅者去做响应的逻辑处理


## 派发更新

todo 1. 了解什么是派发更新 2. 了解派发更新的流程以及其中做的一些优化

派发更新实际上是数据变化，触发`setter` 把在依赖过程中订阅的所有观察者（watcher），都触发他们的update过程

优化：利用队列做了进一步的优化，在nextTick后执行所有的watcher的run，最后再执行他们的回调函数

[理解](https://www.cnblogs.com/chenjinxinlove/p/10037370.html)


## nextTick

tudo 1. nextTick实现原理 2. 数据变化到dom变化是异步的

定义在：`src/core/util/next-tick.js`

总结：
  nextTick 是要把任务队列推送到一个队列中，在下一个tick同步执行

比如从服务端接口去获取数据的时候，数据做了修改，如果我们的某些方法去依赖了数据修改后的 DOM 变化，我们就必须在 nextTick 后执行。

```javaScript

getData(res).then(()=>{
  this.xxx = res.data
  this.$nextTick(() => {
    // 这里我们可以获取变化后的 DOM
  })
})

```

## 检测变化的注意事项

todo: 那些数据的变化是检测不到的 如何解决 以及原理

object/array
响应数据中对于对象的新增删除属性以及数组下标访问修改和添加数据等变化是检测不到的

vue.set(target, key, value) / vue.del(target, key, value) 解决问题
通过vue.set/del 以及数组的api可以解决这些问题，本质上是它们内部手动做了依赖更新的派发`ob.dep.notify()`


## 计算属性与监听属性的区别

todo 计算属性的实现原理 监听属性的实现原理/配置 以及个自的使用场景

计算属性本质上是computed watcher
监听属性本质上是user watcher watch配置：sync/immediate/deep等

使用场景：计算属性使用于模版渲染中，监听属性适用于观察某个值的变化完成业务逻辑

## 组件更新

todo：组件更新过程 更新过程中的虚拟dom/diff算法

src/core/vdom/patch.js
组件更新的核心就是新旧vnode diff，对新旧节点相同及不同的情况作出不同的处理
  * 新旧节点不同的更新流程是创建新节点》更新父节点占位符节点》删除旧节点
  * 新旧节点相同的更新流程是获取他们的children，根据不同情况做不同处理
