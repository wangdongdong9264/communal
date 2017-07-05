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