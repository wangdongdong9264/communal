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

## initState

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

## proxy

proxy (代理)的作用是把`props`和`data`上的属性代理到`vm` 实例上

`proxy`方法通过`Object.defineProperty`把`target[sourceKey][key]`的 get/set 变成对`target[key]`

## observe

observe的功能是检测数据的变化， 位置在`src/core/observer/index.js`
`observe`作用是给非`VNode`的对象类型添加一个`Observer`, 如果已经添加过则直接返回，否则在满足一定条件去实例化一个`Observer`对象实例

## Observer
