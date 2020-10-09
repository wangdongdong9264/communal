# jest 单元测试

定义: 是指对软件中的最小可测试单元进行检查和验证

优势: 从长期来看，可以提高代码质量，减少维护成本，降低重构难度
缺点: 从短期来看，加大了工作量，对于进度紧张的项目中的开发人员来说，可能会成为不少的负担

三连问: 为什么要写单元测试/何时写/测试颗粒度为多少

颗粒度

  1. 逻辑复杂的
  2. 容易出错的
  3. 不易理解的 即使是自己写的过段时也会遗忘,有助于理解代码的功能和需求
  4. 公共代码 工具类
  5. 核心业务代码 产品里最核心/最有业务价值的代码应该有更高的单元测试覆盖率

何时写

  1. TDD(敏捷开发中的一项核心实践和技术，也是一种设计方法论。) 在具体实现代码之前
  2. 与具体实现代码同步开发 (先写少量功能代码,紧接着写单元测试,基本上功能开发完,单元测试也完成了)
  3. 写完功能代码后再写单元测试 (实际上‘事后’编写的单元测试颗粒度都比较大,对比同样的功能代码,采取前两种方案可能有10个小的单元测试来覆盖,每个单元测试比较简单易懂,可维护性/可读性都比较好--重构时单测改动不大 而第三种方案 可能会写一个大的单元测试, 这个单侧的逻辑比较复杂, 因为它要测的东西很多,可读性可维护性就比较差)

为什么要写单元测试

  1. 自己的代码有信心 (修改的代码依然能够通过单测, 起码说明我们修改的代码没有破坏程序的正确性 )
  2. 为代码重构做准备 (看到代码很差劲,想重构,但有担心重构之后出问题,咋办? 如果有单元测试之后情况就不一样了,重构完代码，跑一遍单元测试，如果单元测试都通过，基本上可以保证我们的重构没有破坏原来代码逻辑的正确性。不过前提是之前的写的单元测试质量很好，覆盖率很高。当然这仅限于小范围的重构，比如重构一个类或者函数的实现，但对于大刀阔斧的重构（比如单体重构成微服务，面向库表模式重构成DDD），就不适用，那个时候要重写单元测试了)
  3. 通过单元测试快速熟悉代码 (单元测试不仅起到了测试的作用，还是一种很好的“文档”，通过单元测试，我们不需要深入的阅读代码，便能知道这段代码做什么工作，有哪些特殊情况需要考虑，包含哪些业务)


## 单元测试术语

```js

describe("number test", ()=>{
	it('1 is true', ()=>{
		expect(1).toBeTruthy()
	})
	test('2 is true',()=>{
		expect(2).toBeTruthy()
	})
})

```

1. describe 描述, decribe会形成一个作用域
2. it 断言
3. expect 期望
4. test 测试，类似it


## jest配置文件 jest.config.js

### moduleFileExtensions

测试文件的类型

默认值 ["js", "json", "jsx", "ts", "tsx", "node"]

### transform

转换器 (类似与 webpack loader)

默认值 {"^.+\\.[jt]sx?$": "babel-jest"}

### transformIgnorePatterns

默认值 ["/node_modules/", "\\.pnp\\.[^\\\/]+$"]

### moduleNameMapper

别名 (类似与 webpack alias)

### testMatch

设置识别哪些文件是测试文件（glob形式）与testRegex互斥，不能同时写

默认值 [ "**/__tests__/**/*.[jt]s?(x)", "**/?(*.)+(spec|test).[jt]s?(x)" ]

### testRegex

设置识别哪些文件是测试文件（正则形式），与testMatch互斥，不能同时写

默认值 (/__tests__/.*|(\\.|/)(test|spec))\\.[jt]sx?$

### testURL

设置jsdom环境的URL

默认值 http://localhost

### watchPlugins

定义监视模式菜单提示符 一般用在开发针对工作流程定制的交互式体验

### globals

一组全局变量，需要在所有测试环境中使用

### collectCoverage

指示在执行测试时是否应收集覆盖率信息(简单说就是开启覆盖率)

### coverageReporters

覆盖率报告生成方式(默认是在命令行输出建议将值改成 html)

## 常用的一些测试

### vue/test-utils

vue官方的单元测试库

api:

  1. mount
    创建一个包含被挂载和渲染的 Vue 组件的 Wrapper

  2. shallowMount
    和 mount 一样，创建一个包含被挂载和渲染的 Vue 组件的 Wrapper (shallowMount渲染的子组件是假的，也就是只mount了这一层)

  3. render
    将一个对象渲染成为一个字符串并返回一个 cheerio 包裹器
    在底层使用 vue-server-renderer (做过VueSSR的应该对这个不陌生吧) 将一个组件渲染为静态的 HTML

  4. renderToString
    将一个组件渲染为 HTML

  5. createWrapper
    createWrapper 为一个被挂载的 Vue 实例或一个 HTML 元素创建一个 Wrapper
    类似于写函数式组件



### jest

常用的检查

1. toBe() 用于检验基本数据类型的值是否相等
2. toEqual() 用于检验引用数据类型的值，由于js本身object数据类型的本身特性，引用数据类型对比只是指针的对比，但是需要对比对象的每个值，所以这时候用到的是toEqual()
3. Truthiness 布尔值判断的匹配器
4. toBeNull 只匹配 null
5. toBeUndefined 只匹配 undefined
6. toBeDefined 与 toBeUndefined 相反
7. toBeTruthy 匹配任何 if 语句为真
8. toBeFalsy 匹配任何 if 语句为假
9. 数字匹配器 用于判断数字值之间的对比
10. toBeGreaterThan 大于匹配器
11. toBeGreaterThanOrEqual 大于等于匹配器
12. toBeLessThan 小于匹配器
13. toBeLessThanOrEqual 小于等于匹配器
14. tobe 和 toequal 都是等价功能相同的对于数字
15. toMatch 字符串匹配器 和字符串的match相同
16. toContain 数组匹配器 用于判断数组中是否包含某些值
17. toThrow 报错匹配器 用于测试特定的抛出错误，可以判断报错语句的文字（支持正则匹配），也可以判断报错类型。
18. .not 修饰符允许你测试结果不等于某个值的情况


jest mock function

为什么要使用Mock函数

在项目中，一个模块的方法内常常会去调用另外一个模块的方法。
在单元测试中，我们可能并不需要关心内部调用的方法的执行过程和结果，只想知道它是否被正确调用即可，甚至会指定该函数的返回值

jest.fn()是创建Mock函数最简单的方式，如果没有定义函数内部的实现，jest.fn()会返回undefined作为返回值。


## vue js


## vue TS

[在已经创建的项目安装](https://github.com/vuejs/vue-cli/tree/dev/packages/%40vue/cli-plugin-unit-jest)

```bash

vue add unit-jest

```

### 安装

[官方安装](https://vue-test-utils.vuejs.org/zh/installation/testing-single-file-components-with-jest.html)

```bash

npm install --save-dev jest @vue/test-utils vue-jest ts-jest

```


## node

## webpack

## mongodb
