# docker

起因: 一位同事 不知道干了啥  导致他本地环境node-sass缺失

思考: 能不能统一开发环境, 不受本地环境的影响

解决方案: 虚拟机, docker

## 基本

### 技术选型

虚拟机:

    *. 优点: 系统级别的
    *. 缺点: 
        
        1. 资源占用多 操作系统占用
        2. 冗余步骤多 虚拟机是完整的操作系统，一些系统级别的操作步骤，往往无法跳过，比如用户登录。
        3. 启动慢 要先启动操作系统,再去启动自己的服务

docker容器:

    1.  优势: 
        1. 启动快 相当于启动本机的一个进程
        2. 占用资源少 容器只占用需要的资源
        3. 体积小 只需要包含用到的组件
        
    2.  缺点: 只支持64位 对window支持不好(待定 我也不知道修复没)

---

### 一般的使用场景

    1. 简化配置 例如新员工不需要再配置环境,只需要安装docker
    2. 代码流水线 ci/cd 对前端来说主要是ci(持续集成) 比如jest单元测试
    3. 开发环境即生产环境 提升开发效率,避免出现“在我电脑上是好的呀”
    4. 应用隔离 降低服务器成本,后续的serverless可能会出现 不同应用需要不同的node版本
    5. 快速部署 

---

### 三个基本概念

    1. 镜像（Image）：Docker 镜像（Image），就相当于是一个 root 文件系统。比如官方镜像 ubuntu:16.04 就包含了完整的一套 Ubuntu16.04 最小系统的 root 文件系统
    2.  容器（Container）：镜像（Image）和容器（Container）的关系，就像是面向对象程序设计中的类和实例一样，镜像是静态的定义，容器是镜像运行时的实体。容器可以被创建、启动、停止、删除、暂停等。
    3. 仓库（Repository）：仓库可看着一个代码控制中心，用来保存镜像。

Docker 使用客户端-服务器 (C/S) 架构模式，使用远程API来管理和创建Docker容器。

为什么容器会有这些优势:   容器相对于虚拟机模拟的不是一个完整的操作系统, 而是进程级别的

## 实践

### 安装 参考官网

[docker安装](https://www.docker.com/get-started)

### helloworld(标准开头)

看官方的就行
[https://docs.docker.com/get-started/](https://docs.docker.com/get-started/)

    ```sh
        docker run hello-world
    ```

### 打包

    ```yml

    FROM node
    ## 镜像
    RUN mkdir -p /home/Service
    ## RUN：用于执行后面跟着的命令行命令
    WORKDIR /home/Service
    ## WORKDIR 指定工作目录。用 WORKDIR 指定的工作目录，会在构建镜像的每一层中都存在。（WORKDIR 指定的工作目录，必须是提前创建好的）。 docker build 构建镜像过程中的，每一个 RUN 命令都是新建的一层。只有通过 WORKDIR 创建的目录才会一直存在。
    COPY . /home/Service
    ## COPY 复制指令，从上下文目录中复制文件或者目录到容器里指定路径。
    EXPOSE 8080
    ## EXPOSE 仅仅只是声明端口
    CMD npm run serve
    ## CMD 类似于 RUN 指令，用于运行程序，但二者运行的时间点不同:
    ## CMD 在docker run 时运行。
    ## RUN 是在 docker build。
    ## 作用：为启动的容器指定默认要运行的程序，程序运行结束，容器也就结束。CMD 指令指定的程序可被 docker run 命令行参数中指定要运行的程序所覆盖。
    ## 注意：如果 Dockerfile 中如果存在多个 CMD 指令，仅最后一个生效。
    ## 如果想运行多条指令可以这样：
    ## CMD git pull && npm install && npm start

    ```

构建镜像

    ```sh
        docker build -t nodevue .  
    ```

运行镜像

    ```sh
        docker run -d -p 8000:8080 nodevue  
    ```

### 开发

    ```yml
    FROM node:xxx.xx
    RUN mkdir -p /home/Service
    WORKDIR /home/Service
    COPY . /home/Service
    # VOLUME [ "/home/Service" ]
    ## VOLUME 通过(dockerfile) VOLUME 指令创建的挂载点，无法指定主机上对应的目录，是自动生成的
    RUN npm config set registry https://registry.npm.taobao.org
    RUN npm install
    EXPOSE 8080
    ## EXPOSE 仅仅只是声明端口
    CMD npm run serve
    ```

构建运行

    ```sh
        docker build -t nodev .

        docker run --name test1 -t -d -p 8000:8080 -v /Users/wangdongdong/Downloads/work/other/dockerVolume:/home/Service nodev
    ```

---

进入容器内

    ```sh
        docker exec -it 4591552a4185 bash
    ```

exec 对容器执行某些操作
-it 让容器可以接受标准输入并分配一个伪tty
4591552a4185 是刚刚启动的 nginx 容器唯一标记
bash 指定交互的程序为 bash

### 构建自己的image

.dockerignore 忽略文件

    ```txt

    .git
    node_modules
    npm-debug.log
    ```

发布步骤(类似git)

    1. 登陆
    2. 打标签
    3. 推送

    ```sh

        docker login

        docker image tag [imageName] [username]/[repository]:[tag]

        docker image push [username]/[repository]:[tag]

    ```

### 上线(多环境)

docker-compose.yml

---

目录结构

    ```
    ├── docker-compose.yml
    ├── nginx
    │   ├── Dockerfile
    │   └── nginx.conf
    └── node
        └── Dockerfile
    ```
---

docker-compose.yml

    ```yml
    version: '2.1'
    services:
    nginx:
        build: ./nginx
        volumes:
        - /Users/wangdongdong/Downloads/work/other/dockerConfig/nginx/nginx.conf:/etc/nginx/nginx.conf
        - /Users/wangdongdong/Downloads/work/other/dockerCompose:/www
        ports:
        - 9000:80

    node:
        build: ./node
        volumes: 
        - /Users/wangdongdong/Downloads/work/other/dockerCompose:/home/Service

    ```

node/Dockerfile

    ```yml

    FROM node

    RUN mkdir -p /home/Service
    WORKDIR /home/Service

    RUN npm config set registry https://registry.npm.taobao.org
    RUN npm install
    CMD npm run build
    ```

nginx/Dockerfile

    ```yml

    FROM nginx

    #基于 nginx 相关配置复制到容器
    ADD nginx.conf /etc/nginx/nginx.conf
    ```

nginx/nginx.conf

    ```conf

    #user  nobody;

    worker_processes  2;

    #工作模式及连接数上线
    events {
        worker_connections  1024;   #单个工作进程 处理进程的最大并发数
    }

    http {
        include       mime.types;
        default_type  application/octet-stream;
        #sendfile 指令指定 nginx 是否调用 sendfile 函数（zero copy 方式）来输出文件，对于普通应用，
        sendfile        on;
        #tcp_nopush     on;

        #keepalive_timeout  0;
        keepalive_timeout  65;

        # 开启GZIP
        gzip  on;

        # # 监听 80 端口，转发请求到 3000 端口
        server {
            #监听端口
            listen 80;
            #编码格式
            charset utf-8;

            # 前端静态文件资源
            location / {
                root  /www/dist/;
                index index.html index.htm;
                try_files $uri $uri/ @rewrites;
            }
            # 配置如果匹配不到资源，将url指向 index.html， 在 vue-router 的 history 模式下使用，就不会显示404
            location @rewrites {
                rewrite ^(.*)$ /index.html last;
            }
            error_page   500 502 503 504  /50x.html;
            location = /50x.html {
                root   html;
            }
        }
    }
    ```

---

    ```sh
    docker-compose up -d

    docker-compose up --biuld
    ```
二次构建使用`docker-compose up --biuld`

## 扩展

基于 docker 前端还能做些什么   ci/cd,  webIDE
