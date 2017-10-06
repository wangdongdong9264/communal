##基本

1. 创建SSH key

```
ssh-keyen -t rsa -C "youremail@exapmle.com"
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
