# vim 操作命令

## 基本操作

```txt
h 左
j 下
k 上
l 右

vi fileName 创建新文件/或打开文件
:w  保存
:q  退出
:q! 不保存修改 直接退出
:set nu 显示行号
Ctrl + g // 查看当前文件信息
[number] + G/:[number] // 跳转到number 行
% // 快速找到另一个括号
/! [shell] // 在vim中 执行shell命令
:r // 合并文件
Esc 从命令模式切换m编辑模式
cp 源文件 目标文件 //文件复制
rm 源文件 //文件删除
mv 源文件 目标文件 //文件移动
mkdir 文件名称 //创建文件夹

% // 快速找到另一个括号
>> // 缩进
<< // 退回缩进
vi 文件名.文件类型 //创建文件
/pattern //从光标开始向文件尾搜索pattern
?pattern //从光标开始向文件首搜索pattern
n //在同一方向上重复上一次搜索命令
N //在反方向上重复上一次搜索命令

:s/p1/p2/g //将当前行中所有p1用p2代替
:n1,m2s/p1/p2/g //将n1到n2行所有的p1用p2代替
:g/p1/s//p2/g //将文件中所有的p1用p2代替

touch 修改档案时间
```

## 进入插入模式的方法

```txt
i //在光标的前边
I //在光标所在行的行首

a //在光标后面
A //光标所在行的行尾

o // 光标所在行的下方插入空格
O // 光标说在行的上方插入空格

s // 删除光标指定的字符
S // 光标所在行清除并进入插入模式

```

## motion--表示操作范围的指令

```txt
0/^ // 将光标定位到行首
$ // 光标定位到行尾
b // 将光标定位到光标所在单词的起始处
e // 将光标定位到光标所在单词的结尾处
w // 光标定位到下一个单词的起始处
gg // 将光标定位到文件的开头
G // 光标定位到文件的末尾

```

## 删除

> x //删除单个字符
> 数字 + motion = 重复多个 motion // 4+h == 向右移动四格
> d + 数字 + motion = 删除多个motion范围

## 撤销

```txt
u // 表示撤销最后次修改
U // 表示撤销对整行的修改

Ctrl + r // 恢复撤销的修改
```

## 粘帖

```txt
p // 将最后一次删除的内容粘帖到光标之后
P // 粘帖到光标之前
```

## 拷贝

```txt
y [number] motion
```

## 替换

```txt
r + newkey
[number] + r + newkey // 将光标前number个字符都替换成newkey

R // 进入替换模式
```

## 修改模式

> 修改会进入插入模式， 替换不会进入插入模式

```sh
c [number] motion
```

## 打开多个文件

-o //垂直打开
-O //水平打开

Ctrl + w + w 将光标切换到下一个文件

Ctrl + w + 上/下/左/右 切换文件

## .vimrc

[vim-script](https://linux.cn/article-8997-1.html)

```sh
Bundle 'scrooloose/nerdtree'
Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'Xuyuanp/nerdtree-git-plugin'

autocmd vimenter * NERDTree #vim 启动时自动打开NERDTree
map <C-n> :NERDTreeToggle<CR> #Ctrn + n  打开NERDTree


let g:nerdtree_tabs_open_on_console_startup=1 #vim 启动时运行NERDTreeTabs

set shell=sh
let g:NERDTreeShowIgnoredStatus = 1 #显示ignored状态
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }


Bundle 'Valloric/YouCompleteMe'
Bundle 'Raimondi/delimitMate' #自动关闭引号/括号
Bundle 'Shougo/deoplete.nvim',{ 'do': ':UpdateRemotePlugins' } #自动完成


Bundle 'w0rp/ale'  #检查错误
Bundle 'sheerun/vim-polyglot' #语言包

let g:ale_linters = {
\    'javascript': ['eslint'],
\    'css': ['stylelint'],
\}

let g:ale_fixers = {
\    'javascript': ['eslint'],
\    'css': ['stylelint'],
\}

let g:ale_fix_on_save = 1 #保存后自动修复文件
let g:ale_sign_column_always = 1 #标志槽打开
let g:ale_sign_error = '>>'  #错误标志
let g:ale_sign_warning = '--'  #警告标志
nmap  <silent>  <Ck>  <Plug>（ale_previous_wrap） #Ctrl + k 快速导航到错误
nmap  <silent>  <Cj>  <Plug>（ale_next_wrap）  #Ctrl + j


Bundle 'kien/ctrlp.vim'  ##搜索
Bundle 'mileszs/ack.vim'
let g:ackprg = 'ag --vimgrep'


Bundle 'vim-airline/vim-airline'
Bundle 'vim-airline/vim-airline-themes'
let g:airline#extensions#tabline#enabled = 1 #启动vim-airline
let g:airline_theme='papercolor'  #使用主题

Bundle 'scrooloose/nerdcommenter'
# <leader>cc // 注释
# <leader>cm 只用一组符号注释
# <leader>cA 在行尾添加注释
# <leader>c$ /* 注释 */
# <leader>cs /* 块注释 */
# <leader>cy 注释并复制
# <leader>c<space> 注释/取消注释
# <leader>ca 切换　// 和 /* */
# <leader>cu 取消注释
let g:NERDSpaceDelims = 1  
let g:NERDDefaultAlign = 'left'
let g:NERDCustomDelimiters = {
            \ 'javascript': { 'left': '//', 'leftAlt': '/**', 'rightAlt': '*/' },
            \ 'less': { 'left': '/**', 'right': '*/' }
        \ }


Bundle 'airblade/vim-gitgutter'  #git
Bundle 'tpope/vim-fugitive'


Bundle 'suan/vim-instant-markdown'
let g:instant_markdown_slow = 1
let g:instant_markdown_autostart = 0 #:InstantMarkdownPreview 手动触发预览


Bundle 'mattn/emmet-vim'  #快捷
let g:user_emmet_leader_key='<Tab>'

Bundle 'othree/html5.vim'

Bundle 'hail2u/vim-css3-syntax'
Bundle 'ap/vim-css-color'
augroup VimCSS3Syntax
  autocmd!

  autocmd FileType css setlocal iskeyword+=-
augroup END

Bundle 'pangloss/vim-javascript'
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow = 1
augroup  javascript_folding
    au ！
    au  FileType javascript setlocal  foldmethod = syntax
augroup  END
let g:javascript_conceal_function             = "ƒ"
let g:javascript_conceal_null                 = "ø"
let g:javascript_conceal_this                 = "@"
let g:javascript_conceal_return               = "⇚"
let g:javascript_conceal_undefined            = "¿"
let g:javascript_conceal_NaN                  = "ℕ"
let g:javascript_conceal_prototype            = "¶"
let g:javascript_conceal_static               = "•"
let g:javascript_conceal_super                = "Ω"
let g:javascript_conceal_arrow_function       = "⇒"
let g:javascript_conceal_noarg_arrow_function = "🞅"
let g:javascript_conceal_underscore_arrow_function = "🞅"
set conceallevel=1

Bundle 'mxw/vim-jsx'  #react
let g:jsx_ext_required = 0



Bundle 'prettier/vim-prettier'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql'] }
#:Prettier

---

[ubuntu 目录结构](http://www.cnblogs.com/candycaicai/archive/2011/02/24/1963640.html)
