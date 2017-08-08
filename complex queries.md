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


>OA == 办公系统

>外键




=======
>. computer Memory 
>1 bit = Binary Digit
>8 Bits = 1 Byte
>1024 Bytes = 1 KB(Kilo Byte)
>1024 KB = 1 MB(Mega Byte)
>1024 MB = 1 GB(Giga Byte)
>1024 GB= 1 TB(Terra Byte)
>1024 TB = 1 PB(Peta Byte)
>1024 PB = 1 EB(Exa Byte)
>1024 EB = 1 ZB(Zetta Byte)
>1024 ZB = 1 YB(Yotta Byte)
>1024 YB = 1 (Bronto Byte)
>1024 Brontobyte = 1 (Geop Byte)


>区分主键表和外键表

* 在外键表上创建外键

create database SqlDemos
go 


use sqlDemos
go

--创建表， 表列赋默认值
create table UserInfo
(
    Id int identity(1,1) primark key not null
    Name nvarchar(32) default('sss') null
)

--给数据库的表添加一列
* 如果列名是关键字 用[]
alter table UserInfo add [address] nvarchar(32) null

alter table UserInfo add DelFlag smallint null

--给列添加默认值约束
alter table UserInfo add constraint DF_UserInfo_DelFlag default(0) for DelFlag

--外键约束
--订单表：一个订单中可以包含多个商品
create table OrderInfo
(
    OrderId int identity(1,1) primary key not null
    OrderInfoDes nvarchar(64) null,
    DelFlag int default(0) null,
)
go

--分类表和 商品：一个产品只能属于一个分类，一个分类可以包含多个商品
create table Category
(
    CatId int identity primary key not null,
    CatName nvarchr(32) null,
    ParentCatId int null,
    DelFlag smallint default(0) null
)
go

--在商品表中添加 分类的外键列
alter table Product add CategoryId int null

--添加外键关系
ALTER TABLE Product ADD CONSTRAINT FK_Product_Category FOREIGN KEY(CategoryId)
REFERENCES Category(CatId)



>别名

SELECT 'SSS',* FROM Product
SELECT COUNT(*) FROM Product

--count(*) :找表中最短的列进行统计行数
--count(1)/count(2)/count('ss') 对常数列经行统计行数


>取前几条  

SELECT TOP 3 * FROM tblScore ORDER BY score2 desc , score3 desc

>去除重复数据
SELECT DISTINCT score2 FROM tblScore ORDER BY scorel


>where 条件过滤
1. 多条件过滤： and  or not (优先级：not > and > or)   ! && ||
2. <> 等于 != (不等于)

SELECT * FROM SalesLT.Customer
    WHERE
    CustomerID <100 AND Title<>'Ms.' OR MiddleName='M.'

>区间查询 between and

SELECT *FROM SalesLT.Customer
    WHERE
    CustomerID BETWEEN 20 AND 50

>模糊查询 like

SELECT * FROM SalesLT.Customer
    WHERE  firstName LIKE 'Jac%'

    WHERE CompanyName like '%''%' --两个单引号表示一个单引号
    
    WHERE CompanyName like '%[\[]'  --特殊字符转义  不建议  WHERE CompanyName like '%\[' escape '\'

>查询null的数据 is

SELECT * FROM SalesLT.Customer
    WHERE MiddleName IS null

>数据分组 Group by

SELECT 
    Title,count(*),sum(customeId)
    FROM SalesLT.Customer
    GROUP BY Title

>类型转换 Convert  Cast
1. Convert类型转换：Convert(目标类型，表达式，类型))
2. Cast类型转换：Cast(表达式 as 类型)

SELECT CONVERT(nvarchar(32), CustomerId)+Title FROM SalesLT.Customer

SELECT CAST(CustomerId as nvarchar(32))+Title FROM SalesLT.Customer

>日期函数

1. 查询通话时间最长的5条记录

SELECT TOP 5 id,CallerNumber,
DATEDIFF(second, startdatetime,enddatetime) as dutime
FROM CallRecords
ORDER BY dutime DESC

2. 查询以0开头的通话总时,以秒为计算单位

SELECT 
    SUN(DATEDIFF(SECOND,startdatetime,enddatetime))
FROM CallRecords
WHERE TelNum like '0%'

3. 查询2010年7月通话总时长最多的前两个呼叫员的编号
SELECT 
    TOP 2
    CallerNumber,
    SUN(DATEDIFF(SECOND,startdatetime,enddatetime)) AS 时长
    COUNT(*) AS 电话数
FROM CallRecords
WHERE DATEDIFF(MONTH,'2010-7-1',startdatetime) = 0
GROUP BY
    CallerNumber
ORDER BY 时长 DESC

4. 查询2010年7月拨打电话次数最多的前两个呼叫员的编号

SELECT 
    TOP 2
    CallerNumber,
    COUNT(*) AS 电话数
FROM CallRecords
WHERE DATEDIFF(MONTH,'2010-7-1',startdatetime) = 0
GROUP BY 
    CallerNumber
ORDER BY 电话数 DESC








>other
2. primary key  主键
3. not null / null  是否为空
4. default(18)  默认值
5. identity(1,1)    自动增长 前一个是增长值


[主键/外键](http://www.cnblogs.com/ywb-lv/archive/2012/03/12/2391860.html) 
6. sql 执行顺序
    1. from 找到表->where过滤->Group分组->having 筛选分组结果 ->Order 排序

[sql 死锁](http://www.cnblogs.com/rush/archive/2012/02/19/2358209.html)

[高性能 sql](http://kb.cnblogs.com/page/156213/)

