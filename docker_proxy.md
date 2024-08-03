# docker proxy

several days ago， i found my Docker Desktop for Mac can't use commant 'docker pull xxx' when i need it. so what happen !  a few years ago i changed the docker proxy, since if I used the official URL, I got low speed download. now it can't use.

## reason

the Chinese government demands removal of Docker Hub image repository service。

## how to fix it

1. find a new service, but you don't know how many people use it and its stability
2. use Cloudflare for Workers & Pages, however, sometime unable
3. build one with your own server

## third solution

these steps just provide basic information.  you can see the Registry2 Document about advanced config.

### step one

run docker commant

```sh

docker run -d -p 5000:5000 --restart=always --name registry registry:2

```

### step two

configurations Nginx （ must be https ）

```js

upstream dockerproxy {
    server 127.0.0.1:5000;
}


server {
    listen 80;
    server_name  docker.yourdomain.xyz;
    return 301 https://$server_name$request_uri;
}


server {
    listen 443 ssl;
    server_name docker.yourdomain.xyz;
    ssl_certificate   cert/docker.yourdomain.xyz_bundle.pem;
    ssl_certificate_key  cert/docker.yourdomain.xyz.key;
       location / {
            proxy_set_header   X-Forwarded-For $remote_addr;
            proxy_set_header   Host $http_host;
            proxy_pass         http://dockerproxy;
       }
}

```

don't forget reload nginx `nginx -s reload`

### step three

open your docker client > setting > Docker Engine

add proxy configuration to the specified location

```json
{
    "registry-mirrors": [
        "https://docker.yourdomain.xyz"
    ]
}
  

```

click `apply and restart`

### step four

open new terminal and run `docker pull node` or other

## other

[registry2 docker image](https://hub.docker.com/_/registry)

[registry2 document](https://distribution.github.io/distribution/)

[configure docker to ues a proxy server](https://docs.docker.com/network/proxy/)
