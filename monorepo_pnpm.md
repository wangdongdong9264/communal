# pnpm

`performant npm` 快速的，节省磁盘空间的包管理工具

## 原理

软链

### 扩展

文件的本质是什么：是一个指针，不过不是指向内存地址，而是指向外部存储的地址

删除也是删除指针 无论多大的文件都可以很快删掉（数据恢复）

### 文件

### ext4 文件系统

ps：为啥不选ntfs（不熟呀）

ext 文件系统中柱面结构

![ext 文件系统中柱面结构](http://img.wangdongdong9264.xyz/ext_filesystem.png)

三个重要的概念：

`superblock`: 记录有关封闭文件系统的各种信息，例如块计数、inode 计数、支持的功能、维护信息等（比较复杂 不做过多讨论）

`inode`: 默认大小为 128 Byte，用来记录文件的权限（r、w、x）、文件的所有者和属组、文件的大小、文件的状态改变时间（ctime）、文件的最近一次读取时间（atime）、文件的最近一次修改时间（mtime）、文件的数据真正保存的 block 编号。每个文件需要占用一个inode（不记录文件名）

`block`: 大小可以是 1KB、2KB、4KB，默认为 4KB。block 用于实际的数据存储，如果一个 block 放不下数据，则可以占用多个 block。（例如，有一个 10KB 的文件需要存储，则会占用 3 个 block，虽然最后一个 block 不能占满，但也不能再放入其他文件的数据。这 3 个 block 有可能是连续的，也有可能是分散的）

### 硬链接&软链接

```sh

# ln命令
# ln [选项] 源文件 目标文件
# 软链接的源文件必须写绝对路径
```

选项：

  `-s`:建立软链接文件 如果不加`-s`选项，则建立硬链接文件
  `-f`:强制 如果目标文件已经存在，则删除目标文件后再建立链接文件

---

 查找过程（以`/www/README.md`为例）：

 1. 首先找到根目录的`inode`，然后判断用户是否有权限访问跟目录的`block`
 2. 如果有权限，则可以在跟目录的`block`中访问到`/www`目录对应的`inode`号
 3. 通过`/www`目录的`inode`号，可以查找到`/www`目录的`inode`信息，再走权限判断（www目录的block）
 4. 如果有权限，则可以在`www`目录的`block`中访问到`README.md`文件对应的`inode`号
 5. 通过`README.md`文件的`inode`号，可以查找到`README.md`文件的`inode`信息，再次权限判断（`README.md`文件的block）
 6. 如果有权限，就读取`README.md`文件的`block`中的数据

硬链接过程（简化）：

假设 源文件硬链接的目录是`/Users/wangdongdong/Downloads/readme.md`

1. 建立硬链接后，`Downloads`目录的block中建立一个`inode`（其它内容忽略），它的编号跟`www/`目录的block中README.md文件的`inode`编号一样
2. 既然编号一样 按照查找过程 最终读写的是同一个文件内容

![硬链接流程图](http://img.wangdongdong9264.xyz/soft_link.png)

硬链接的特点：

1. 不论是修改源文件，还是修改硬链接文件，另一个文件中的数据都会发生改变
2. 不论是删除源文件，还是删除硬链接文件，只要还有一个文件存在，这个文件（inode号相同的文件）都可以被访问
3. 硬链接不会建立新的`inode`信息，也不会更改`inode`的总数
4. 硬链接不能跨文件系统（分区）建立，因为在不同的文件系统中，`inode`号是重新计算的
5. 硬链接不能链接目录，因为如果给目录建立硬链接，那么不仅目录本身需要重新建立，目录下所有的子文件，包括子目录中的所有子文件都需要建立硬链接，这对当前的Linux来讲过于复杂

正是硬链接的限制比较多，既不能跨文件系统，也不能链接目录，而且源文件和硬链接文件之间除`inode`号是一样的之外，没有其他明显的特征。这些特征都使得硬链接并不常用

---

```sh

ln -s /Users/wangdongdong/Downloads/React/readme.md /Users/wangdongdong/Downloads/React/other/Readme.md

# lrwxr-xr-x "l"就代表软链接文件
# 在文件的后面通过 "->" 显示出源文件的完整名字

```

![软链接 特征](http://img.wangdongdong9264.xyz/Soft_link.png)

软连接过程（简化）：

假设 源文件软链接的目录是`/Users/wangdongdong/Downloads/React/other/Readme.md`

1. 省略前面的路径
2. 访问 `/other/` 目录的`inode`信息，判断用户是否有权限访问`/other` 目录的`block`。
3. 如果有权限，就会在 `block` 中读取到软链接文件 `Readme.md` 的 `inode` 号。（因为软链接文件会真正建立自己的 `inode` 索引和`block`，所以软链接文件和源文件的`inode`号是不一样的）。
4. 通过软链接文件的`inode`号，找到了 `Readme.md` 文件`inode` 信息，判断用户是否有权限访问`block`。
5. 如果有权限，就会发现 `Readme.md` 文件的 `block` 中没有实际数据，仅有源文件 `readme.md` 的 `inode` 号。
6. 接着通过源文件的 `inode`号，访问到源文件 `readme.md` 的 `inode` 信息，判断用户是否有权限访问 `block`。
7. 如果有权限，就会在 `readme.md` 文件的 `block` 中读取到真正的数据，从而完成数据访问

![软链接流程图](http://img.wangdongdong9264.xyz/hard_link.png)

软链接（类似快捷方式）的特点：

1. 不论是修改源文件，还是修改软链接文件，另一个文件中的数据都会发生改变
2. 删除软链接文件，源文件不受影响。而删除原文件，软链接文件将找不到实际的数据，从而显示文件不存在
3. 软链接会新建自己的`inode`信息和`block`，只是在`block`中不存储实际文件数据，而存储的是源文件的文件名及`inode`号
4. 软链接可以链接目录
5. 软链接可以跨分区

## 解决了哪些问题

## 还有哪些未解决

## monorepo

默认你已经了解 `lerna`, `yarn workspace`

## pnpm workspace

### 开始

```sh

pnpm init

```

添加配置文件[pnpm-workspace.yaml](https://pnpm.io/pnpm-workspace_yaml) 在项目根目录

```yaml

packages:
  # all packages in subdirs of packages/
  - 'packages/**'
  # exclude packages that are inside test directories
  - '!**/test/**'

```

新建`packages`文件夹, 所有的包都放在这个文件夹内

新建几个空包 `web`,`web2`, `web3`

每个项目进行`pnpm init`初始化（注意`name` 后面要用到）

公共的依赖安装在根目录下 例如react`pnpm i react -w`

子包中的依赖安装 例如moment `pnpm i moment -r --filter YouPackagesName`

包跟包之间的依赖 例如web1依赖web2 `pnpm i web1 -r --filter web2`

根文件依赖包 例如index.tsx依赖web2 `pnpm i web2 -w`

卸载根依赖包 `pnpm uninstall web2 -w`

卸载包依赖包 `pnpm uninstall web2 -r --filter YouPackagesName`

[-C -w 参数限制](https://pnpm.io/pnpm-cli)

[--filter 将命令限制为特定的包子集](https://pnpm.io/filtering)

## rush

版本控制

### 开始

```sh

npm install -g @microsoft/rush

```

初始化

```sh

rush init # 空文件下夹执行

```

在`.vscode`文件夹下面建立`settings.json`并添加如下内容 （解决json文件注释红线问题）

```json

{
  "files.associations": {
    "*.json": "jsonc"
  }
}

```

### rush add



### rush update

作用：

1. rush 检查/应用有时会更新`common/config`下的文件的各种策略
2. rush 将您的所有项目`package.json`文件与存储库的通用收缩包文件进行比较，以查看它是否有效
3. 如果它已经过时，包管理器都会更新`shrinkwrap`文件
4. 无论哪种方式，包管理器都会将所有依赖安装到`common/temp/node_modules`文件夹中
5. 最后，rush通过将符号链接设置为`common/temp/node_modules`为每个项目构建一个本地`node_modules`文件夹（与`rush link`命令相同）

### 命令

## 问题

~~包版本管理呢 ? [https://pnpm.io/workspaces](https://pnpm.io/workspaces)~~

为什么要monorepo：

  1. 统一技术栈（降低团队成员之间的backup成本）
  2. 可以在业务开发中，灵活地将代码抽出作为公共模块
  3. 省去了在多个repo情况下，给团队新成员开通repo权限的时间

## 其它

[POSIX，全称为可移植性操作系统接口](https://pubs.opengroup.org/onlinepubs/9699919799.2018edition/)

[官方性能对比](https://pnpm.io/benchmarks)

[posix 解释](https://zhuanlan.zhihu.com/p/392588996)

[ext4 文件系统 wiki](https://en.wikipedia.org/wiki/Ext4)

[ext4 文件系统 介绍](https://opensource.com/article/17/5/introduction-ext4-filesystem)

[Linux 内核档案 ext4](https://www.kernel.org/doc/Documentation/filesystems/ext4.txt)

[ext4 Super_Block](https://ext4.wiki.kernel.org/index.php/Ext4_Disk_Layout#The_Super_Block)
