# typeScript 编译原理

## 版本

version 4.1.3

1.77GB 就尼玛离谱

## src目录结构

```txt

├── bin         最终给用户用的 tsc 和 tsserver 命令
├── doc         语言规范文档
├── lib         系统标准库
├── loc         错误文案翻译
├── scripts     开发项目时的一些工具脚本
├── src         源码
│   ├── compiler        编译器源码
│   └── services        语言服务，主要为 VSCode 使用，比如查找定义之类的功能
└── tests       测试文件

```

## 编译器

TypeScript 编译器源文件位于 `src/compiler` 目录下

重点文件

```txt
├── core.ts
├── sys.ts
├── types.ts
├── scanner.ts
├── parser.ts
├── utilities.ts
├── utilitiesPublic.ts
├── binder.ts
├── checker.ts
├── transformer.ts
├── transformers/
├── emitter.ts
└── program.ts
```

## 核心部分的架构

1. 编译器
  1. 工具
    1. 工具函数
    2. 文件操作
    3. 内部工具
  2. 语法解析
    1. 词法分析
    2. 语法分析
  3. 语意分析
    1. 作用域分析
    2. 类型检查
  4. 优化生成
    1. 代码转换
    2. 最后生成
