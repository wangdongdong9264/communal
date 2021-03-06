# 安装 软件

> 修复依赖

```sh
sudo apt --fix-broken install
```

---

1. .deb

    ```sh
    sudo dpkg -i package_name.deb
    ```

2. .sh

    ```sh
    ./filename.sh       可安装到当前用户有权限的目录
    sudo ./filename.sh  可安装到任意目录
    sudo sh filename.sh
    sudo sh hmode +x filename.sh
    ```

3. .bin

    ```sh
    sudo ./filename.bin 可安装到任意目录
    ./filename.bin      可安装到当前用户有权限的目录
    sudo chmod +x filename.bin
    ```

## 卸载软件

```sh
sudo apt-get remove filename
```

## 重命名

1. 将A重命名B

    ```sh
    mv A b
    ```

2. 创建文件夹或文件

    ```sh
    mkdir filename // 创建空文件夹

    touch filename // 创建空文件
    ```

## 删除文件或文件夹

```sh
rm filename

rm -r filename      向下递归，有多少级目录一并删除
rm -f filename      直接强行删除，没有提示
rm -f file\ name    删除名称为file name到目录 空格需转意
```

## .tar

```sh
tar xvf filename.tar


tar cvf filename.tar DirName

```

## .tar.bz2

```sh
tar jxvf filename.tar.bz2


tar jcvf filename.tar.bz2 DirName
```

## .tar.gz

```sh
tar zxvf filename.tar.gz


tar zcvf filename.tar.gz DirName
```

## tar.xz

```sh
xz -d filename.tar.xz

tar -z filename.tar
```

## 安装 webstorm

1. 官网下载
2. 解压 tar zxvf filename.tar.gz
3. 移动 mv filename /usr/lib/
4. cd /usr/lib/filename/
5. 安装 sh bin/webstorm.sh

## node 开发环境

1. 官网下载
2. 解压 tar -d filename.tar.xz | tar xvf filename.tar
3. 移动 sudo mv filename /opt/
4. 安装 sudo ln -s /opt/filename/bin/node /usr/loacl/bin/node | sudo ln -s /opt/filename/bin/npm /usr/loacl/bin/npm

## java 环境

1. 官网下载
2. 解压 tar zxvf filename.tar.gz
3. 移动 mv filename /usr/java
4. 配置环境变量
    * 获取权限          sudo -s
    * 打开profile     vi /etc/profile
    * 配置profile

    ```sh
    export JAVA_HOME=/usr/java/jre1.8.0_144
    export JRE_HOME=/usr/java/jre1.8.0_144/jre
    export CLASSPATH=.:$CLASSPATH:$JAVA_HOME/lib:$JRE_HOME/lib
    export PATH=$PATH:$JAVA_HOME/bin:$JRE_HOME/bin

    ```

    * 保存退出 :wq

## vim IDE

1. 下载 vundle 包管理工具

    ```sh
    git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

    // 如果没有~/.vim/bundle 这个目录就 mkdir 一个
    ```

2. 在.vimrc 中添加bundle的配置

    ```txt

    set nocompatible                " be iMproved
    filetype off                    " required!
    set rtp+=~/.vim/bundle/vundle/
    call vundle#rc()
    " let Vundle manage Vundle
    Bundle 'gmarik/vundle'
    "my Bundle here:
    "
    " original repos on github
    Bundle 'kien/ctrlp.vim'
    Bundle 'sukima/xmledit'
    Bundle 'sjl/gundo.vim'
    Bundle 'jiangmiao/auto-pairs'
    Bundle 'klen/python-mode'
    Bundle 'Valloric/ListToggle'
    Bundle 'SirVer/ultisnips'
    Bundle 'Valloric/YouCompleteMe'
    Bundle 'scrooloose/syntastic'
    Bundle 't9md/vim-quickhl'
    " Bundle 'Lokaltog/vim-powerline'
    Bundle 'scrooloose/nerdcommenter'

    Bundle 'terryma/vim-multiple-cursors'
    Bundle 'Shougo/neocomplcache.vim'
    Bundle 'tpope/vim-commentary'
    Bundle 'scrooloose/nerdtree'
    "..................................
    " vim-scripts repos
    Bundle 'YankRing.vim'
    Bundle 'vcscommand.vim'
    Bundle 'ShowPairs'
    Bundle 'SudoEdit.vim'
    Bundle 'EasyGrep'
    Bundle 'VOoM'
    Bundle 'VimIM'

    " Bundle 'jslint.vim'
    Bundle 'jsflakes'
    Bundle 'mozjs.vim'
    Bundle 'html_FileCompletion'
    Bundle 'html5.vim'
    Bundle 'css3-syntax-plus'
    Bundle 'preview'
    " Bundle 'mark.vim'
    Bundle 'zencoding.vim'




    "..................................
    " non github repos
    " Bundle 'git://git.wincent.com/command-t.git'
    "......................................
    filetype plugin indent on

    ```

3. 安装上面的插件

    * 打开vim ':BundleInstall' or Ctrl + Alt + T 'vim +BundleInstall +qall'

4. other

    ```sh
    :BundleUpdate // 更新插件
    :BundleClean // 清理不用的插件
    :BundleList // 列出所有插件
    :BundleSearch // 查找插件

    ```

---

## 其它

1. 软件最好安装在 /usr/lib/

    [windows & ubuntu](https://jingyan.baidu.com/article/4d58d5411380dd9dd5e9c07e.html)

    [ubuntu android开发环境](http://www.linuxidc.com/Linux/2014-05/101149.htm)

    [vim nodejs](http://www.cnblogs.com/JohannaFeng/p/5059435.html)

2. 终端命令下

    >复制命令：`Ctrl + Shift + C`
    >粘贴命令：`Ctrl + Shift + V`

3. 快速打开终端

    >`Ctrl + Alt + T`

4. 查看内存/cpu

    ```sh
    free -m         //单独查看内存使用情况
    ```

5. 查看u盘

    ```sh
    cd /media/
    ```

6. 获取root权限

    ```sh
    sudo passwd root
    su root

    sudo passwd -1 root     禁用root
    ```

    > 如果再执行su root 发现认证失败 再次执行sudo passwd -u root 就行

7. 切换到user用户

    ```sh
    su user || exit || Ctrl + D
    ```

8. 普通用户无法更改的文件

    ```sh
    sudo -s
    vi filename
    ```

9. 工作区快速切换

    ```sh
    Ctrl + Alt + 方向键
    ```

10. 修改 .bashrc

    ```sh
    gedit ~/.bashrc         打开记事本修改
    source ~/.bashrc        让其生效
    ```

### sql server for ubuntu

```sh
SA
Wang9264
```

### 更新

```sh
sudo apt-get update // 更新软件源

sudo apt-get upgrade // 更新已安装的软件

sudo apt-get dist-upgrade // 更新系统

sudo apt --fix-broken install // 修复依赖

```

[关于架构](http://kb.cnblogs.com/page/569057/)

[ubuntu git 链接github](http://www.cnblogs.com/yourihua/archive/2012/07/07/2580147.html)

### 关机

```sh
shutdown -h now //立即关机

shutdown -r now //立即重启
```

### ubuntu 拷贝

1. 拷贝文件

    ```sh
    cp -i filename /url/newfilename
    ```

2. 拷贝 文件夹

    ```sh
    cp -r /url/ /newUrl/       // 将url目录下面的所有文件复制到newUrl
    ```

### 移动

1. 移动文件夹

```sh
mv /url/* /newUrl/      // 将url目录下的所有文件移动到newUrl
```

### 删除

1. 删除文件夹

```sh
rm -r /url/         // 将url目录下的所有文件都给删除
```

---

[ubuntu 目录结构](http://www.cnblogs.com/candycaicai/archive/2011/02/24/1963640.html)
