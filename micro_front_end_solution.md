# 微前端的几种解决方案

## iframe

html提供的标签, 能兼容所有的浏览器

iframe 最大的特性就是提供了浏览器原生的硬隔离方案，不论是样式隔离、js 隔离这类问题统统都能被完美解决。但他的最大问题也在于他的隔离性无法被突破，导致应用间上下文无法被共享，随之带来的开发体验、产品体验的问题

缺点:

  1. url 不同步。浏览器刷新 iframe url 状态丢失、后退前进按钮无法使用
  2. UI 不同步，DOM 结构不共享
  3. 全局上下文完全隔离，内存变量不共享。
  4. 慢。每次子应用进入都是一次浏览器上下文重建、资源重新加载的过程

## web Components

google推出的浏览器原生组件

参考mdn的概念, 它由三项主要技术组成，它们可以一起使用来创建封装功能的定制元素，可以在你喜欢的任何地方重用，不必担心代码冲突

1. Custom elements（自定义元素）: 一组JavaScript API，允许您定义custom elements及其行为，然后可以在您的用户界面中按照需要使用它们

2. Shadow DOM（影子DOM）: 一组JavaScript API，用于将封装的“影子”DOM树附加到元素（与主文档DOM分开呈现）并控制其关联的功能。通过这种方式，您可以保持元素的功能私有，这样它们就可以被脚本化和样式化，而不用担心与文档的其他部分发生冲突

3. HTML templates（HTML模板）: `<template>` 和 `<slot>` 元素使您可以编写不在呈现页面中显示的标记模板。然后它们可以作为自定义元素结构的基础被多次重用

根据这些描述,  `web Components`是以组件的形式将微应用整合为微前端的

缺点: 兼容性

  1. Firefox(版本63)、Chrome和Opera都默认支持Web组件。
  2. Safari支持许多web组件特性，但比上述浏览器少。
  3. Edge正在开发一个实现。(edge 这个指的是旧edge, 新的使用`Chromium`)

可以通过polyfill来解决兼容问题

[webcomponents.js (v1 spec polyfills)](https://github.com/webcomponents/polyfills/tree/master/packages/webcomponentsjs)

```sh
npm install @webcomponents/webcomponentsjs

```

## ES Module

估计你会很好奇着不是es2015中提到的一种前端模块化手段吗 跟微前端有什么关系呢

回忆一下微前端的特性:

  1. 无技术栈限制
  2. 应用独立开发
  3. 多应用整合

再看看es module

  1. 无技术栈限制: esM加载的只是js, 但是无论哪个框架,最终都要编译js
  2. 应用独立开发: esM只是一种规范, 不影响开发模式
  3. 多应用整合: 只需要将应用以esM的方式暴露出来, 就能正常加载
  4. 远程加载模块: esM能直接请求远程(一般是cdn)资源, `<script type="module" src='xxx'>`

## qiankun

最早成型且知名度最广的单页微前端框架

特点(这里就直接引用官方):

  1. 基于`single-spa`封装, 提供了开箱即用的api
  2. 技术栈无关, 任意技术栈的应用均可 使用/接入
  3. `html entry`接入方式，让你接入微应用像使用 iframe 一样简单
  4. 样式隔离, 确保微应用之间样式互相不干扰
  5. JS 沙箱, 确保微应用之间 全局变量/事件 不冲突
  6. 资源预加载, 在浏览器空闲时间预加载未打开的微应用资源，加速微应用打开速度
  7. umi 插件，提供了 `@umijs/plugin-qiankun` 供 umi 应用一键切换成微前端架构系统

## EMP

新起之秀(第一次听到这个框架是在某个大会上), 除了具备微前端的能力外, 还实现了跨应用状态共享, 跨框架组件到能力,这些是qiankun没有的

特点:

  1. 基于webpack5的`Module Federation`, 达到第三方依赖共享,减少不必要的代码引入
  2. 每个微应用独立部署运行, 通过cdn的方式引入主程序中, 因此每个微应用中的代码有变动时，无需重新打包发布新的整合应用便能加载到最新的微应用
  3. 去中心化(区别于qiankun), 每个微应用间都可以引入其它微应用, 无基座概念
  4. 跨技术栈组件式调用，提供了在主应用框架中可以调用其他框架组件的能力
  5. 按需加载，开发者可以选择只加载微应用中需要的部分，而不是强制只能将整个应用全部加载
  6. 应用间通信，每一个应用都可以进行状态共享，就像在使用npm模块进行开发一样便捷
  7. 生成对应技术栈模板，它能像cerate-react-app一样，也能像create-vue-app一样，通过指令一键搭建好开发环境，减少开发者的负担
  8. 远程拉取ts声明文件，emp-cli中内置了拉取远程应用中代码声明文件的能力，让使用ts开发的开发者不再为代码报错而烦恼

### 其它

[iframe mdn](https://developer.mozilla.org/zh-CN/docs/Web/HTML/Element/iframe)

[Why Not Iframe](https://www.yuque.com/kuitos/gky7yw/gesexv)

[Web Components 官网](https://www.webcomponents.org/)

[Web Components mdn](https://developer.mozilla.org/zh-CN/docs/Web/Web_Components)

[11 Micro Frontends Frameworks](https://itnext.io/11-micro-frontends-frameworks-you-should-know-b66913b9cd20)

[qiankun 官网](https://qiankun.umijs.org/zh)

[早早聊大会 微前端专场](https://www.yuque.com/docs/share/403a1c32-0677-4223-9190-15ac00fd01b1)

[早早聊大会 EMP专场](https://www.yuque.com/zaotalk/posts/zkoo9p)

[emp github](https://github.com/efoxTeam/emp)

[SPA 与 MPA 的比较与优化](https://set.sh/post/180804-spa-and-mpa)
