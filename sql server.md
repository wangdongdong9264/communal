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


