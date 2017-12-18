##基本

1. 创建SSH key

```
ssh-kegen -t rsa -C "youremail@exapmle.com"
```

>会在C:\Users\用户名\.ssh\目录下生成两个文件id-rsa和id-rsa.pub两个密钥，id-rsa是私钥，id-rsa.pub是公钥

2. 添加SSH key

>登陆github/点击头像/settings/SSH and GPG keys/点击New SSH key  添加你的id-rsa.pub密钥

3. 从远程仓库克隆到本地

```
git clone git@github.com:wangdongdong9264/communal.git

or
git clone https://github.com/wangdongdong9264/communal.git
```

4. 向github提交代码

>全局下配置你的github邮箱和github名字

```
git config --global user.email "github邮箱"
git config --global user.name "github名字"

```

>先链接下远程库

```
git remote add origin git@github.com:wangdongdong9264/communal.git
```

>添加本地文件

```
git add -A
```

>提交

```
git commit -m "提交的注释"
```

>提交到远程

```
git push -u origin master
```

4. 工作区状态

>仓库的状态

```
git status
```

>具体修改

```
git diff
```

5. 版本回退

>历史纪录

```
git log
```

>回退到上一个版本或n个版本

```
git reset --hard HEAD^

git reset --hard HEAD~n
```


>命令记录

```
git reflog
```

>恢复到某个版本

```
git reset --hard [commit id]
```

6. 撤销修改

* 修改还没有放到暂存区

```
git checktout --filename
```

* 已提交到暂存区，并做了修改

```
git reset HEAD filename
```

7. 删除/误删
```
git rm filename         //删除

git checkout --filename // 恢复误删的本地
```

8. 创建/切换/合并/删除分支

```
git branch                  // 查看分支
git branch [name]           // 创建分支
git checkout [name]         // 切换分支     快捷创建和切换分支 git checkout -b [name]
git merge [name]            // 合并name分支到当前分支
git branch -d [name]        // 删除分支

```

9. 冲突

* 先解决再提交冲突
* 查看分支合并图
```
git log --graph
```

10. 隐藏当前工作区，建立新的分支，恢复工作区

```
git stash                   // 隐藏当前工作区

git stash list              // 查看隐藏的工作区
git stash apply [workname]  // 恢复但不删除 需git stash drop手动删除
git stash pop               // 恢复并删除
            
```

>  git push origin master时出现Username for 'https://github.com':

```
git remote set-url origin git+ssh://git@github.com/yourname/reponame.git
```

## git 开启多颜色输出

```
git config --global color.status auto
git config --global color.diff auto
git config --global color.branch auto
git config --global color.interactive auto
```
* 2017/11-
 * 建顾企业号
 * 1. nodejs + koa2 
 * 2. 与企业后端数据对接，推送项目进度
 * 
 * 
 * 2017/10-2017/11
 * 上海动研建筑科技发展有限公司
 * 项目角色
 * 1. 使用h5c3 + bootstrap + jquery + orchard
 * 2. 配合产品经理进行改版
 * 项目描述
 * 1. 是上海动研建筑科技发展有限公司的官网
 * 1. 项目分为主页，公司简介，公司产品，公司业绩，项目案例，新闻动态，减隔震知识，合作流程，联系我们等模块组成
 * 2. 主页要求美观， 需要有动态的效果来吸引顾客
 * 建顾网站
 * 
 * 2017/07-2017/9
 * 建顾项目管理系统
 * 1. 听取客户需求，整理文档
 * 2. 使用knowout.js 实现业务逻辑
 * 3. jquery + easyui 搭建页面
 * 4. 使用sql server 创建数据表
 * 5. 页面加载速度的优化
 * 项目描述
 * 建顾内部使用的系统，用来显示每个项目进度
 * 
 * 2017/04-1017/06
 * 新疆数字化工程建设智能监管系统
 * 项目角色
 * 2. 使用knowout.js 实现业务逻辑
 * 3. jquery + easyui 搭建页面
 * 4. 使用创建表格模板 stimulsoft Report
 * 4. 使用sql server 
 * 5. 优化网站兼容性
 * 项目描述
 * 实现数据可视化，方便查看和预警
     
