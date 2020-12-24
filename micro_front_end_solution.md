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

## EMP

### 其它

[iframe mdn](https://developer.mozilla.org/zh-CN/docs/Web/HTML/Element/iframe)

[Why Not Iframe](https://www.yuque.com/kuitos/gky7yw/gesexv)

[Web Components 官网](https://www.webcomponents.org/)

[Web Components mdn](https://developer.mozilla.org/zh-CN/docs/Web/Web_Components)

[11 Micro Frontends Frameworks](https://itnext.io/11-micro-frontends-frameworks-you-should-know-b66913b9cd20)
