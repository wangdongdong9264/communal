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