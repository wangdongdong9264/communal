# vuex 插件

## logger

位置：src/plugins/logger.js

参数：this (store实例)

执行Store构造函数时就会执行插件(前提是你配置了)

### subscribe方法

定义在 src/store.js

```js

subscribe (fn) {
  return genericSubscribe(fn, this._subscribers)
}

```

`this._subscribers` 每次提交 mutation 修改之后 （订阅者）

### createLogger方法


### filter 参数

默认情况：永远返回true 即每次 mutation 打印输出

### collapsed 参数

输出状态：展开折叠

### transformer/mutationTransformer 参数

state/mutation 输出格式
默认返回

### logger 参数

默认： console
