# 安装

1. 安装

2. 配置环境变量

3. 创建数据存储目录`c:/data/db`,日志`c:/data/log`

4. 启动

```sh
mongod
```

5. 连接

```sh
mongo
```

## 高级启动

```sh
mongod --dbpath YOUDBPATH --port YOUPORT
```

## 将mongodb 设置为系统服务

  1. 安装目录创建配置文件 `mongod.cfg`

  ```cfg
  systemLog:
      destination: file
      path: e:\data\log\mongod.log
  storage:
      dbPath: e:\data\db
  ```

  2. 创建MongoDB服务(admin) 必须cmd,不要用powerShell

  ```sh
  sc.exe create MongoDB binPath= "\"E:\mongoDB\bin\mongod.exe\" --service --config=\"E:\mongoDB\mongod.cfg\"" DisplayName= "MongoDB" start= "auto"
  ```

  3. 启动

  ```sh
  net start MongoDB
  ```

## 三个概念

  * 数据库（database）
    数据库是一个仓库，在仓库中可以存放集合

  * 集合（collection）
    集合类似于数组，在集合中可以存放文档

  * 文档（document）
    文档数据库中最小的单位，我们存储和操作的内容都是文档


## 基本指令

1. 显示数据库

```sh
show dbs
```

2. 进入数据库

```sh
use databaseName
```

3. 当前所处的数据库

```sh
db
```

4. 显示集合

```sh
show collection
```

5. 插入文档`db.<collectionName>.insert(document)`

6. 查询`db.<collectionName>.find()`

## 安装GUI `mongodbmanagerfree`或者`studio 3T`


###other

集合和数据库 都不需要手动创建 第一次插入文档时创建

向集合中添加文档时 如果没有给文档指定`_id`属性，则数据库会自动为文档添加`_id` 该属性用来作为文档的唯一标识
