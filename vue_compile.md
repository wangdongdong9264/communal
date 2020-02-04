# vue 编译

## 基本

把模版(template)编译成render函数的过程，这个过程就是编译

vue提供了两个版本
  * Runtime+Compile：包含编译代码的，可以把编译放在运行时做
  * Runtime only：不包含编译代码的，需要借助打包工具，例如webpack的vue-loader，来把模版编译成render函数

## 入口

todo 1.编译入口函数的位置 2.vue为什么要这样设计

位置： Runtime+Compile版`src/platforms/web/entry-runtime-with-compiler.js`

总结：
  1. vue在不同平台上都会有编译过程，只是编译过程依赖的`baseOptions`不同
  2. 利用了函数柯里化实现了baseOptions的参数保留。
  3. 同理，vue利用函数柯里化把baseCompile函数抽离出来，把真正编译的过程和其它逻辑如对编译的配置处理，缓存处理等分离开来

## parse

作用：就是把template转换成ast树
原理：利用正则表达式

转换ast共有三种类型
  * type === 1 普通元素
  * type === 2 表达式
  * type === 3 纯文本

转换结果和浏览器保持一致 例如:

  ```html

    <p>123<p>456</p></p>
    <!--  转换为 -->
    <p>123</p><p>456</p><p></p>
  ```


## optimize

todo: 优化的目标/过程

目标：通过优化静态根的方式 ，优化重新渲染过程中对静态节点的处理逻辑

原理：深度遍历ast树，先标记静态节点(static)，在标记静态根节点(staticRoot)

## codegen

todo: 编译的目标/编译的整体流程

目标：把ast树转换成代码字符串

原理： 深度遍历ast树根据不同条件生成不同代码
