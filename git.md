# git 基本

1. 创建SSH key

```sh
ssh-kegen -t rsa -C "youremail@exapmle.com"
```

>会在C:\Users\用户名\.ssh\目录下生成两个文件id-rsa和id-rsa.pub两个密钥，id-rsa是私钥，id-rsa.pub是公钥

2. 添加SSH key

>登陆github/点击头像/settings/SSH and GPG keys/点击New SSH key  添加你的id-rsa.pub密钥

3. 从远程仓库克隆到本地

```sh
git clone git@github.com:wangdongdong9264/communal.git

or
git clone https://github.com/wangdongdong9264/communal.git
```

4. 向github提交代码

>全局下配置你的github邮箱和github名字

```sh
git config --global user.email "github邮箱"
git config --global user.name "github名字"

```

>先链接下远程库

```sh
git remote add origin git@github.com:wangdongdong9264/communal.git
```

>添加本地文件

```sh
git add -A
```

>提交

```sh
git commit -m "提交的注释"
```

>提交到远程

```sh
git push -u origin master
```

4. 工作区状态

>仓库的状态

```sh
git status
```

>具体修改

```sh
git diff
```

5. 版本回退

>历史纪录

```sh
git log
```

>回退到上一个版本或n个版本

```sh
git reset --hard HEAD^

git reset --hard HEAD~n
```

>命令记录

```sh
git reflog
```

>恢复到某个版本

```sh
git reset --hard [commit id]
```

6. 撤销修改

* 修改还没有放到暂存区

```sh
git checktout --filename
```

* 已提交到暂存区，并做了修改

```sh
git reset HEAD filename
```

7. 删除/误删

```sh
git rm filename         //删除

git checkout --filename // 恢复误删的本地
```

8. 创建/切换/合并/删除分支

```sh
git branch                  // 查看分支
git branch [name]           // 创建分支
git checkout [name]         // 切换分支     快捷创建和切换分支 git checkout -b [name]
git merge [name]            // 合并name分支到当前分支
git branch -d [name]        // 删除分支

```

9. 冲突

* 先解决再提交冲突
* 查看分支合并图

```sh
git log --graph
```

10. 隐藏当前工作区，建立新的分支，恢复工作区

```sh
git stash                   // 隐藏当前工作区

git stash list              // 查看隐藏的工作区
git stash apply [workname]  // 恢复但不删除 需git stash drop手动删除
git stash pop               // 恢复并删除
```

> git push origin master时出现Username for 'https://github.com':

```sh

git remote set-url origin git+ssh://git@github.com/yourname/reponame.git

```

## git 开启多颜色输出

```sh

git config --global color.status auto
git config --global color.diff auto
git config --global color.branch auto
git config --global color.interactive auto

```
## 提交规范

1. husky
2. lint-staged
3. Eslint
4. Prettier
5. @commitlint/config-conventional @commitlint/cli
6. commitizen cz-conventional-changelog

安装 husky

```sh

yarn add -D husky lint-staged

yarn add -D @commitlint/{config-conventional,cli}

```

在package.json 添加配置

```json

"husky": {
  "hooks": {
    "pre-commit": "lint-staged",
    "commit-msg": "commitlint -E HUSKY_GIT_PARAMS"
  }
}

```

添加 `.commitlintrc.json` 配置文件

[commitlint 官方文档](https://commitlint.js.org/#/)

```json
{
  "extends":[
    "@commitlint/config-conventional"
  ],
  "rules": {
    "body-leading-blank": [1, "always"],
    "footer-leading-blank": [1, "always"],
    "header-max-length": [2, "always", 72],
    "scope-case": [2, "always", "lower-case"],
    "subject-case": [
        2,
        "never",
        ["sentence-case", "start-case", "pascal-case", "upper-case"]
    ],
    "subject-empty": [2, "never"],
    "subject-full-stop": [2, "never", "."],
    "type-case": [2, "always", "lower-case"],
    "type-empty": [2, "never"],
    "type-enum": [
        2,
        "always",
        [
          "feat",
          "fix",
          "perf",
          "css",
          "style",
          "refactor",
          "revert",
          "docs",
          "chore",
          "types",
          "test",
          "wip"
        ]
    ]
  }
}
```

添加 commitizen 提交工具

```sh

yarn add -D commitizen cz-conventional-changelog

```

配置 cz

```json

{
  "path": "cz-conventional-changelog"
}

```

在package.json 添加提交配置

```json

"scripts": {
  "commit": "cz"
}

```
