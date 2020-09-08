# jest 单元测试

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


## 常用的一些测试

## vue js

## vue TS

### 安装

[官方安装](https://vue-test-utils.vuejs.org/zh/installation/testing-single-file-components-with-jest.html)

```bash

npm install --save-dev jest @vue/test-utils vue-jest ts-jest

```


## node

## webpack
