# vue 非核心

## event

todo

1. event的实现原理
2. dom事件和自定义事件的区别

编译流程 3个阶段
1. parser  模版 -> ast树  执行 processAttrs 方法来处理标签 `src/compiler/parser/index.js`
2. optimize，标注静态节点
3. generate，生成render表达式

首先通过 parseModifiers 方法来解析出修饰符 源码位置 `src/compiler/parser/index.js`

如果是事件指令则 addHandler 方法来处理事件  源码位置 `src/compiler/helpers.js`


### addHandler函数

todo:
  1. 根据 参数`modifiers` 修饰符对事件名`name`做不同处理
  2. 再根据 参数`modifiers.native` 的值 来判断是原生事件/普通事件()
  3. 最后 根据 `events[name]` 对事件做归类并把回调函数字符串添加到对应的事件中
