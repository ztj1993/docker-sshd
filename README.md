# docker-ztj1993-sshd

sshd 基础映像

## 相关链接
- [GitHub](https://github.com/ztj-docker/sshd)
- [DockerHub](https://hub.docker.com/r/ztj1993/sshd)

## 构建教程
```
docker build -t ztj1993/sshd .
```

## 使用教程
```
docker run -ti --rm ztj1993/sshd
```

## 更新日志

> 2020-11-16

- 采用 ubuntu:20.10 镜像
- 默认密码 123456

> 2020-07-15

- 重构项目
- 实现修改 root 密码

> 2020-06-04

- 使用 alpine:3.11.6 基础镜像
- 使用自带的 openssh-server

> 2020-05-13

- 使用 panubo/sshd:1.2.0 基础镜像
- 实现 root 用户密码登录
