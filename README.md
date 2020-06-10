# 使用Docker发布[Create React App](https://github.com/facebook/create-react-app)应用到nginx

## 使用的image

- [node](https://hub.docker.com/_/node) 构建应用
- [nginx](https://hub.docker.com/_/nginx) 静态服务器

## build && run

```bash
$ docker build -t docker-cra-nginx .
$ docker run -it --rm --init -p 8085:80 docker-cra-nginx

# 浏览器访问http://localhost:8085
```

## 使用Bind Mounts挂载文件测试

在开发过程中，可以将目标目录下的文件挂载进容器进行测试，而省去每次修改都需要`docker build`的麻烦：

```bash
# 挂载静态资源和配置文件
$ docker run -it --rm --init -v $PWD/build:/usr/share/nginx/html -v $PWD/nginx.conf:/etc/nginx/nginx.conf -p 8085:80 nginx
# 或另一种方式
$ docker run -it --rm --init --mount type=bind,source=$(pwd)/build,target=/usr/share/nginx/html --mount type=bind,source=$(pwd)/nginx.conf,target=/etc/nginx/nginx.conf -p 8085:80 nginx
```
