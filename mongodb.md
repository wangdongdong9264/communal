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
