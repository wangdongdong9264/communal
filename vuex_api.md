# vuex API

todo:
  1. vuex数据存储的api
  2. 常用的语法糖
  3. 模块动态注册的过程

## Mutation

执行`registerMutation`函数

作用执行自己定义的函数

## action

初始化 执行`registerAction`函数 位置 src/store.js

先判断返回是否是Promise, 不是则Promise化


## dispatch

判断 entry `this._actions[type]` 的长度， 如果大于1 则使用 Promise.all

这也说明 action 为啥要返回Promise的原因


## 子模块

子模块通过 makeLocalContext 自动拼接上 namespace + '/' + FunctionName

## 语法糖

位置： src/helpers.js

先通过 `normalizeNamespace`方法做归一化处理

再通过 `normalizeMap`方法 转化数组

本质上就是对 this.$store 的 二次封装

## 动态注册Module

registerModule方法

位置： src/store.js

调用`this._modules.register(path, rawModule)`

执行初始化的逻辑 installModule & resetStoreVM

## 移除Module

unregisterModule

调用 `this._modules.unregister(path)`

执行 resetStore(this)

## 总结

这些api都是方便对store的操作,语法糖的设计可以更改方便使用这些api
