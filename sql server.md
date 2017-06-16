###sql server 数据类型

>string 类型
1. char
2. varchar(n)
3. text
4. nchar
5. nvarchar(max)
6. ntext
7. bit
8. binary(n)
9. varbinary
10. varbinary(max)
11. image

---
>number 类型
1. tinyint 
2. smallint
3. int
4. bigint
5. decimal(p,s)
6. numeric(p,s)
7. smallmoney
8. money
9. float(n)
10. real

---
>date 类型
1. datetime
2. datetime2
3. smalldatetime
4. date
5. time
6. datetimeoffset
7. timestamp

---
>other
1. sql_variant
2. uniqueidentifier
3. xml
4. cursor
5. table


###sql 对大小写不敏感

###sql 语句后面的分号

* 分号是在数据库系统中分割每条sql语句的标准方法，这样就可以在对服务器的相同请求中执行一条以上的语句

### sql DML 和 DDL
1. DML（数据操作语言）
2. DDL（数据定义语言）
* 查询和更新指令构成了DML

```
select - 从数据库表中获取数据
update - 更新数据库表中的数据
delete - 从数据库表中删除数据
insert into - 向数据库表中插入数据
```

* sql 中重要的DDL语句

```
create database - 创建新数据库
alter database - 修改数据库
create table - 创建新表
alter table - 变更（改变）数据库表
drop table - 删除表
create index - 创建索引（搜索键）
drop index - 删除索引
```

---

###创建数据库


```
create database test
on
primary(name=test,  
        filename='E:\test\test.mdf',
        size=4mb,
        maxsize=10mb,
        filegrowth=2mb
        )
log on
        (name=testlog,
        filename='E:\test\testlog.ldf',
        size=1mb,
        maxsize=5mb,
        filegrowth=1mb
        )
```

---
###创建数据表

```
USE Test
GO
IF EXISTS(SELECT NAME FROM SYS.TABLES WHERE NAME='Student')
DROP TABLE Student
GO
CREATE TABLE Student
(
	Sname NCHAR(10),
	Sex NCHAR(2),
	Bir DATETIME
)
```

---

###
```
ALTER TABLE 表名 ALTER COLUMN 列名 类型 null
```

---

### sql 基础

1. select
* 用于重表中选取数据

```
select 列名称 from 表名称
```
2. select distinct
* 用于返回唯一不同的值

```
select distinct 列名称 from 表名称
```

3. where
* 有条件地从表中选取数据

```
select 列名称 from 表名称 where 列 运算符 值
```
>运算符
* =
* <>    !=
* >
* <
* >=
* <=
* between   在某个范围内
* like  搜索某种模式

4. and 和 or
* and - 如果第一个条件和第二个条件都成立，则 AND 运算符显示一条记录
* or -  如果第一个条件和第二个条件中只要有一个成立，则 OR 运算符显示一条记录

```
SELDCT 列名称 FROM 表名称 WHERE 列名称='条件' OR 列名称2='条件2'
```

5. ORDER BY
* 用于根据指定的列对结果集进行排序 
* 默认按照升序对记录进行排序 
* 按照降序对记录进行排序，可以使用 DESC 关键字

```
SELDCT 列名称 FROM 表名称 ORDER BY 列名称 DESC, 列名称 ASC
```

6. insert
* INSERT INTO 语句用于向表格中插入新的行

```
INSERT INTO 表列名 VALUES (值, 值2...)
```
>指定所需要插入数据的列

```
INSERT INTO 表列名 (列, 列2...) VALUES (值, 值2...)
```

7. UPDATE
* 用于修改表中的数据

```
UPDATE 表名称 SET 列名称 = 新值 WHERE 列名称 = 值
```

8. DELETE 
* 用于删除表中的行

```
DELETE FROM 表名称 WHERE 列名称 = 值
```

>删除所有行
* 在不删除表的情况下删除所有的行。这意味着表的结构、属性和索引都是完整的
```
DELETE * FROM 表名称
```











##注意

1. SQL 使用单引号来环绕文本值（大部分数据库系统也接受双引号）。如果是数值，请不要使用引号

2. SQL Server插入中文数据出现乱码问题
```
INSERT INTO Student (Sname) VALUES (N'测试');
```

##其它

[SQL SERVER 无法连接到（local）](http://jingyan.baidu.com/article/b24f6c82c52ed686bfe5da17.html)

>注释
* 单行注释：--
* 多行注释：/*......*/


