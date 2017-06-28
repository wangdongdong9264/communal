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


###sql 约束
>NOT NULL
* NOT NULL 约束强制列不接受 NULL 值
* NOT NULL 约束强制字段始终包含值。这意味着，如果不向字段添加值，就无法插入新记录或者更新记录

>UNIQUE
* UNIQUE 约束唯一标识数据库表中的每条记录
* UNIQUE 和 PRIMARY KEY 约束均为列或列集合提供了唯一性的保证,PRIMARY KEY 拥有自动定义的 UNIQUE 约束
* 每个表可以有多个 UNIQUE 约束，但是每个表只能有一个 PRIMARY KEY 约束

>PRIMARY KEY
* PRIMARY KEY 约束唯一标识数据库表中的每条记录
* 主键必须包含唯一的值
* 主键列不能包含 NULL 值
* 每个表都应该有一个主键，并且每个表只能有一个主键

>FOREIGN KEY
* FOREIGN KEY 约束用于预防破坏表之间连接的动作
* FOREIGN KEY 约束也能防止非法数据插入外键列，因为它必须是它指向的那个表中的值之一

```
CREATE TABLE table_name
(
        column_name data_type FOREIGN KEY REFERENCES table_name2(column_name)
        
)
```

* 如果需要命名 FOREIGN KEY 约束，以及为多个列定义 FOREIGN KEY 约束

```
CREATE TABLE table_name
(
        PRIMARY KEY (column_name),
        CONSTRAINT fk_name FOREIGN KEY (column_name)
        REFERENCES table_name(column_name)
)
```

* 如果需要命名 FOREIGN KEY 约束，以及为多个列定义 FOREIGN KEY 约束

```
ALTER TABLE table_name
ADD CONSTRAINT fk_name
FOREIGN KEY (column_name)
REFERENCES table_name2(column_name)
```

* 如需撤销 FOREIGN KEY 约束

```
ALTER TABLE table_name
DROP CONSTRAINT fk_name
```

>CHECK
* CHECK 约束用于限制列中的值的范围

```
CREATE TABLE table_name
(
        column_name data_type constraint CHECK (constraints)
)
```

* 需要命名 CHECK 约束，以及为多个列定义 CHECK 约束

```
CRTATE TABLE table_name
(
        CONSTRAINT chk_name CHECK (column_name>0 column_name2='data_name')
)
```

* 撤销 CHECK 约束

```
ALTER TABLE table_name
DROP CHECK chk_name
```

>DEFAULT
* DEFAULT 约束用于向列中插入默认值

```
CREATE TABLE table_name
(
        column_name data_type DEFAULT 'default_name'
)
```

* 在表已存在的情况下为 "City" 列创建 DEFAULT 约束

```
ALTER TABLE table_name
ALTER COLUMN column_name SET DEFAULT 'default_name'
```

* 撤销 DEFAULT 约束

```
ALTER TABLE table_name
ALTER COLUMN column_name DROP DEFAULT
```


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

###引用两张表

```
SELECT 
```

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

9. TOP
* 用于规定要返回的记录的数目

```
SELECT TOP NUMBER|PERCENT COLUMN_NAME(S) FROM TABLE_NAME
```

10. LIKE
* 操作符用于在 WHERE 子句中搜索列中的指定模式

```
SELECT COLUMN_NAME(S) FROM TABLE_NAME WHERE COLUMN_NAME LIKE PATTERN
```

11. 通配符
* 在搜索数据库中的数据时，SQL 通配符可以替代一个或多个字符
* SQL 通配符必须与 LIKE 运算符一起使用

1. %    替代一个或多个字符
2. _    仅替代一个字符
3. [CHARLIST]   字符列中的任何单一字符
4. [^CHARLIST] OR [!CHARLIST]     不在字符列中的任何单一字符


12. IN
* 操作符允许我们在 WHERE 子句中规定多个值
SELECT COLUMN_NAME(S) FROM TABLE_NAME WHERE COLUMN_NAME IN (VALUE,VALUE2,...)

13. BETWEEN AND
* 会选取介于两个值之间的数据范围。这些值可以是数值、文本或者日期

```
SELECT COLUMN_NAME(S)
FROM TABLE_NAME
WHERE COLUMN_NAME
BETWEEN VALUE AND VALUE2

```

14. ALIAS
* 为列名称和表名称指定别名

```
SELECT COLUMN_NAME(S)
FROM TABLE_NAME
AS ALIAS_NAME
```

15. JOIN AND KEY
*  join 用于根据两个或多个表中的列之间的关系

```
SELECT column_name(s)
FORM table_name 
INNER JOIN table_name2
ON table_name.column_name = table_name2.column_name
```

* LEFT JOIN 关键字会从左表 (table_name) 那里返回所有的行，即使在右表 (table_name2) 中没有匹配的行

* RIGHT JOIN 关键字会从右表 (table_name2) 那里返回所有的行，即使在左表 (table_name) 中没有匹配的行

* FULL JOIN 只要其中某个表存在匹配，FULL JOIN 关键字就会返回行


16. UNION 和 UNION ALL
* UNION 操作符用于合并两个或多个 SELECT 语句的结果集
* UNION 内部的 SELECT 语句必须拥有相同数量的列。列也必须拥有相似的数据类型。同时，每条 SELECT 语句中的列的顺序必须相同。
* UNION ALL 命令和 UNION 命令几乎是等效的，不过 UNION ALL 命令会列出所有的值* 

```
SELECT column_name(s) FROM table_name
UNION
SELECT column_name(s) FROM table_name2

```

17. SELECT INTO 
* SELECT INTO 语句从一个表中选取数据，然后把数据插入另一个表中

```
SELECT *
INTO new_table_name [IN externaldatabase]
FROM old_tablename
```

18. CREATE DATABASE
* CREATE DATABASE 用于创建数据库

```
CREATE DATABASE database_name
```

19. CREATE TABLE 
* CREATE TABLE 语句用于创建数据库中的表

```
CREATE TABLE table_name
(
        column_name data_type,
        column_name2 data_type2,
        column_name3 data_type3,
        ...
)
```

20. 




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


