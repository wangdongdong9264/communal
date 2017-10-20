pwd



vi fileName
i 
:w  保存
:q  退出
:set nu	显示行号
Esc	从命令模式切换m编辑模式
cp 源文件 目标文件	文件复制
rm 源文件		文件删除
mv 源文件 目标文件	文件移动
mkdir 文件名称		创建文件夹
vi 文件名.文件类型	创建文件
/pattern		从光标开始向文件尾搜索pattern
?pattern		从光标开始向文件首搜索pattern
n			在同一方向上重复上一次搜索命令
N			在反方向上重复上一次搜索命令

:s/p1/p2/g		将当前行中所有p1用p2代替
:n1,m2s/p1/p2/g		将n1到n2行所有的p1用p2代替
:g/p1/s//p2/g		将文件中所有的p1用p2代替

touch			修改档案时间


