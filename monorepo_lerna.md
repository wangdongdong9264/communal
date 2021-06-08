# lerna and yarn

## lerna

作用：版本控制，包发布

### lerna 基本命令及说明

```shell

lerna init #初始化项目

lerna create <name> [loc] # 创建一个包， name包名，loc位置可选

lerna add [@version] [--dev] [--exact]

# 新增本地或远程package作为当前行项目packages里面的依赖
# `--dev` devDependencies 替代 dependencies
# `--excat` 安装准确版本，就是安装的包版本前面不带`^`

lerna bootstrap # 默认是`npm`, 可以lerna.json的`npmClient`指定`yarn`

lerna list # 列出所有的包

lerna import <path-to-external-repository> # 导入本地已经存在的包

lerna run <script> -- [..args] # 运行所有包里面的有这个script的命令

lerna exec -- < command > [..args] # 在每个包运行任意命令

lerna link # 将当前 Lerna 存储库项目包建立软链

lerna clean # 删除所有包的node_modules

lerna changed

# 列出下次发版lerna publish 要更新的包
# 原理： 需要先`git add`, `git commit` 提交。 然后内部会运行`git diff --name-only v`版本号，搜集改动的包，就是下次要发布的

lerna publish # 发布自上次发布以来更改过的包

lerna version # 自上次发布以来，包的 Bump 版本发生了变化

lerna diff [package]

# 比较自上次发布以来的所有包或单个包 
# 类似于lerna changed。此命令运行git diff

lerna info # 在info打印出证明尤其是在提交错误报告是有用的本地环境的信息

```

### 包之间依赖

```shell

# Install module-1 to module-2 in devDependencies
lerna add module-1 --scope=module-2 --dev

# Install module-1 to module-2 in peerDependencies
lerna add module-1 --scope=module-2 --peer

```

### lerna的两种模式

1. 固定模式 `lerna init --exact`
2. 独立模式 `lerna init --independent`

固定模式（默认）：
  
* 通过`lerna.json`的版本进行版本管理。当你执行`lerna publish`命令时，如果距离上次发布只修改了一个模块，将会更新对应模块的版本号到新的版本号，然后你可以只发布修改的库.
* 例如 babel任何一个package的`major change`均会导致所有包都会进行`major version`的更新

独立模式：

* 每个包都有自己的独立的版本号，lerna会配合git，检查文件变动，只发布有改动的package

### lerna缺点

一般情况下package的依赖都是在各自的`node_modules`目录下, 这会出现同一个依赖有多个包的情况

虽然lerna bootstrap 提供了`--hoist`选项，但是lerna直接以字符串对比依赖的版本号，同一个依赖在版本号完全相同的情况下才会提升到根目录下

这就需要yarn来解决这个问题

## yarn workspaces

作用：依赖管理

### 基本命令

```shell

yarn workspace <workspaceName> <commandName>
# workspaceName 工作区域的名字
# commandName yarn命令 eg: add -D axios

# 安装在根工作区(workspace root)
yarn add jest -D -W

# 安装在指定工作区
yarn workspace @mo-demo/utils add lodash@4

# 删除跟目录的依赖
yarn remove jest -W
  
# 删除指定工作区的依赖(不用加版本号)
yarn workspace  @mo-demo/utils remove lodash

# 执行指定工作区的scripts命令
yarn workspace <workspaceName> run <scriptName>

```

### 配置package.json

1. 在package.json必须有`workspaces`字段
2. 在根packge.json文件中定义

如果你在项目中启用了[yarn 2.x](https://yarnpkg.com/getting-started/install)那么`private: true`不是必须的

### 配置lerna.json

在lerna.json中把`"npmClient": "npm"`改成`"npmClient": "yarn"`

## 其它

[lerna github](https://github.com/lerna/lerna)

[yarn workspaces 文档](https://yarnpkg.com/features/workspaces/)

[lerna+yarn workspace+monorepo项目的最佳实践](https://juejin.cn/post/6844903918279852046)

[Lerna 中文教程详解](https://juejin.cn/post/6844903856153821198#heading-0)

[lerna & yarn](https://zhuanlan.zhihu.com/p/108118011)

[封装Vue组件库 Yarn workspaces 和 lerna](https://blog.csdn.net/u012961419/article/details/108704826)
