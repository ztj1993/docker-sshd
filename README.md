# docker-ztj1993-sshd

sshd 基础映像，使用的 panubo/docker-sshd 1.2.0 构建。

## 相关链接
- [GitHub](https://github.com/ztj-docker/sshd)
- [DockerHub](https://hub.docker.com/r/ztj1993/sshd)
- [Panubo](https://github.com/panubo/docker-sshd)

## 使用教程
```
docker run -ti --rm ztj1993/sshd
```

## 环境变量
- ROOT_PASSWORD：根用户密码

## 更新日志

> 2020-05-13

- 使用 panubo/sshd:1.2.0 基础镜像
- 实现 root 用户密码登录
