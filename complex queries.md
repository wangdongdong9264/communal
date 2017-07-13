##复杂的查询


####嵌套子查询

```
SELECT <SELCET list>
FROM <SomeTable>
WHERE <SomeColumn> = (
    SELECT <single column>
    FROM <SomeTable>
    WHERE <condition that results in only one row returned>
)
```
or

```
SELECT <SELECT list>
FROM <SomeTable>
WHERE <SomeColumn> IN (
    SELECT <single column>
    FROM <SomeTable> 
    [WHERE <cndition>]
)
```


####关联子查询

```

```

####派生表

```
```
####EXISTS / NOT EXISTS 运算符 
1. 根据是否存在数据满足查询中EXISTS 语句所建立的条件标准，返回简单的TRUE OR FALSE 结果

```
SELECT BusinessEntityID, LastName + ', ' + FirstName AS Name
FROM Person.Person pp
WHERE EXISTS
   (SELECT BusinessEntityID 
           FROM HumanResources.Employee hre
           WHERE hre.BusinessEntityID = pp.BusinessEntityID);
```


####混合数据类型 CAST 和 CONVERT
* 都可以执行数据类型换，但CONVERT 还提供一些日期格式转换
* CAST 也能进行日期转换，不能像CONVERT 那样控制日期格式

```
CAST (expression AS data_type)

CONVERT(data_type, expression[, style])


```


##other

>查看端口命令

```
netstat -a -n
```

>登陆本地sql server
1. .
2. (local)
3. 计算机全名
4. 127.0.0.1

>打开服务

```
services.msc
```

>int 
1. int > 4字节 >32位
2. 1字节 = 8位


>nchar char 区别
1. NChar,Nvarchar(32)  	N:Unicode，2个字节表示一个字符。
2. Char：一个字节表示一个字符。

>nvarchar nchar 区别
1. nvarchar 节省空间，牺牲性能
2. nchar    相反


>数据库的迁移方案
1. 分离 附加    
	1. 1. 权限问题：
			1. 1. 1. 启用Administrator账号
			1. 1. 2. 把数据库文件放到默认的数据库文件存放目录。
    1. 2. 数据库文件兼容级别，设置成2005兼容
	
2. 脱机 附加
	
3. 备份 还原
	
4. 生成SQL脚本(最好)







