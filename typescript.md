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
    1. 工具函数 core.ts
    2. 文件操作 sys.ts
    3. 内部工具 utilities.ts
  2. 语法解析
    1. 词法分析（扫描器） scanner.ts
    2. 语法分析（解析器） parser.ts
  3. 语意分析
    1. 作用域分析（绑定器） binder.ts
    2. 类型检查（检查器） checker.ts
  4. 优化生成
    1. 代码转换 transformer.ts
    2. 最后生成（发射器） emitter.ts


## 流程概览

```txt

SourceCode（源码） ~~ 扫描器 ~~> Token 流

```

```txt

Token 流 ~~ 解析器 ~~> AST（抽象语法树）

```

```txt

AST ~~ 绑定器 ~~> Symbols（符号）

```

符号（Symbol）是 TypeScript 语义系统的主要构造块
符号是绑定的结果
符号将 AST 中的声明节点与相同实体的其他声明相连

符号和ast是检查器用来验证源代码语义

```txt

AST + 符号 ~~ 检查器 ~~> 类型验证

```

ast和检查器是发射器用来输出js

```txt

AST + 检查器 ~~ 发射器 ~~> JavaScript 代码

```

[ts内部术语](https://github.com/microsoft/TypeScript-Compiler-Notes/blob/main/GLOSSARY.md)

[编译过程 概述](https://www.youtube.com/watch?v=X8k_4tZ16qU&list=PLYUbsZda9oHu-EiIdekbAzNO0-pUM5Iqj&index=5)
