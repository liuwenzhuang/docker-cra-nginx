# 使用Docker发布[Create React App](https://github.com/facebook/create-react-app)应用到nginx

## 使用的容器

- [node](https://hub.docker.com/_/node) 构建应用
- [nginx](https://hub.docker.com/_/nginx) 静态服务器

## build && run

```bash
$ docker build -t docker-cra-nginx .
$ docker run -it --rm --init -p 8085:80 docker-cra-nginx

# 浏览器访问http://localhost:8085
```
