# vue 组件化

## 解释

 1. 就是把页面拆分成多个组件
 2. 每个组件依赖的css,js,template,资源放在一起开发和维护
 3. 组件是独立的, 在系统内部可以嵌套/复用

## createComponent

位置：src/core/vdom/create-component.js

组件生成的vnode的特点  
  1. vue-component-${Ctor.cid}${name ? `-${name}` : ''}
  2. vnode.childen === undefind

过程：
  1. 构造子类构造函数
  2. 安装组件钩子函数
  3. 实例化vnode

createComponent返回vnode，然后调用`vm._update`方法，进而执行了patch函数

## patch

todo
  1. 组件patch的整体流程
  2. 流程中`activeInstance`/`vm.$vnode`/`vm._vnode`
  3. 嵌套组件的插入顺序

过程：
  1. createComponent
  2. 子组件初始化
  3. 子组件render
  4. 子组件patch(如果子组件嵌套子组件 重复1)

activeInstance 为当前激活的vm实例。
vm.$vnode为当前组件的占位vnode，`vm._vnode`组件的渲染vnode；
嵌套组件的插入顺序是先子后父

## 合并配置 mergeOptions/initInternalComponent

位置：src/core/instance/init.js

执行时期：
  1. new Vue()
  2. 子组件初始化

总结：
  1. 外部调用场景(例如 mixins)下的合并配置是通过mergeOptions，并遵循一定的合并策略
  2. 组件合并是通过initInternalComponent，比mergeOptions快，没有合并策略
  3. 框架/库的设计都是类似的，自身定义了默认配置，同时可以在初始化阶段传入配置，然后merge配置，来达到定制化不同需求的目的

## 生命周期性

本质：就是在初始化及数据更新过程各个阶段执行不同的钩子函数

  1. beforeCreate
  2. created
  3. beforeMount 先父后子
  4. mounted  先子后父
  5. beforeUpdate
  6. updated
  7. beforeDestroy
  8. destroyed
  9. activated
  10. deactivated

一般情况：
  1. created钩子函数可以访问到数据
  2. mounted钩子函数可以访问到dom
  3. destroyed钩子函数可以做定时器销毁等工作

## 组件组册

todo: 组件注册的两种方式--全局组件/局部组件 的差异性

位置：src/core/global-api/assets.js

差异性：
  1. 全局组件可以任意地方使用，局部只能在当前组件内使用
  2. 一般情况下组件库的基础组件建议全局组册， 而业务组件建议局部组册

## 异步组件

todo: 异步组件实现原理/异步组件3种实现方式

本质：渲染2次(高级异步组件可能有多次)，先渲染成注释节点，当组件渲染成功后，再通过forceRender重新渲染

实现方式：
  1. 工厂函数
  2. promise
  3. 高级异步组件
