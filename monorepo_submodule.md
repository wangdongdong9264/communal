# submodule

## 常用命令

```bash

git clone <repository仓库地址> --recursive # 递归的方式克隆整个项目,子模块也会克隆
git submodule add <repository子模块仓库地址> <path想要放置在主项目路径> # 添加子模块
git submodule update --recursive --remote # 拉取所有子模块的更新

```

## 使用

### 克隆已有子模块项目

```bash

git clone git@xxxx.git --recursive #递归的方式克隆整个项目,子模块也会克隆

git submodule update --recursive --remote #拉取所有子模块的更新

```

### 现有项目添加子模块仓库

```bash

# 假设另一个厂库放着utils模块， 需要放在主项目中执行（src/utils/）

git submodule add git@xxxx.git ./src/utils #添加子模块 （主项目中必须没有utils文件夹）

```

### 修改子模块

一般来说，不同仓库的文件应该在不同的工作目录下修改，但是实际情况下，子模块的效果必须在主项目的工作目录下调试，才能进行开发，这就导致了修改子模块的某个文件，会引起主项目和子模块git检查的变化。（问题1）

对于主项目而言，子模块的内容发生变动时，通常有3中情况：

1. 当前项目下的子模块发生了未跟踪的内容变动
2. 当前项目下的子模块发生了版本变化
3. 当前项目下的子模块没有变化，但远程有更新

---

问题1：通常是在开发环境中，直接修改子模块文件夹中的代码导致的

  这种情况下需要进入子模块文件夹中 按照子模块的版本控制体系提交代码

  当完成提交后，主项目的状态则进入了情况2

---

问题2：当子模块版本变化时，在项目中使用`git status`查看状态时，会显示子模块有新的提交

  这种情况下可以使用`git add/commit`将其添加到主项目的代码提交中，实际的改动就是那个子模块

---

问题3：通常情是子模块负责维护自己的版本升级后，推送到远程仓库，并通知主项目可以更新依赖的子模块

  主模块可以使用`git submodule update` 更新子模块的代码，但那是指`当前主项目文件夹下的子模块目录内容`与`当前主项目记录的子模块版本`不一致时，会参考后者进行更新。

  但是在当前情况下，后者`当前项目的子模块版本`还没有发生变化，在主项目看来当前情况一切正常

  此时需要主动进入子模块拉取新代码，进行升级操作

  ```bash

    cd child_module_path

    git pull origin master

    # 如果子项目特别多 可以使用submodule命令

    git submodule foreach 'git pull origin master'

  ```

  子模块的版本发生变化，主项目的状态进入问题2

### 删除子模块

```bash

git submodule deinit /src/utils # .git/config

git rm -rf /src/utils # 删除文件

rm -rf .git/modules/src/utils

# 提交代码

git commit -m "del utils"

```

至此就完成了子模块的删除
