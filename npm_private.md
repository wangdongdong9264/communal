# npm 私有仓库

## 为什么要搭建npm私有仓库

1. 安全: 把公共组件放到私有npm仓库,只有内网可以访问,这样可以避免敏感代码泄漏
2. 下载速度: 使用内部的地址，能够在开发下载 npm 包的同时，将包和其依赖包缓存到 npm 私有仓库服务器中，从而使后续的下载速度更快

## npm私有仓库原理

用户通过 install 向私有 npm 发起请求，fu会先查询所请求的这个模块是否是我们自己的私有模块或已经缓存过的公共模块，如果是则直接返回给用户；如果请求的是一个还没有被缓存的公共模块，那么则会向上游源请求模块并进行缓存后返回给用户。上游的源可以是 npm 官方源，也可以是淘宝镜像源

## 技术选型

* verdaccio （其优点是搭建简单，不需要其他服务）
* cnpm （需要数据库服务，支持 redis 缓存）
  
## 其它

[verdaccio 官网 https://verdaccio.org](https://verdaccio.org)

[cnpmcore 开发文档](https://github.com/cnpm/cnpmcore/blob/main/DEVELOPER.md)

