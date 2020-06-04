FROM alpine:3.11.6

LABEL maintainer="Ztj <ztj1993@gmail.com>"

ENV ROOT_PASSWORD="123456"

RUN apk add --no-cache openssh-server

RUN ssh-keygen -q -N "" -t dsa -f /etc/ssh/ssh_host_dsa_key
RUN ssh-keygen -q -N "" -t rsa -f /etc/ssh/ssh_host_rsa_key
RUN sed -i "s@^#PermitRootLogin.*@PermitRootLogin yes@" /etc/ssh/sshd_config
RUN sed -i "s@^PermitRootLogin.*@PermitRootLogin yes@" /etc/ssh/sshd_config
RUN sed -i "s@^PasswordAuthentication.*@PasswordAuthentication yes@" /etc/ssh/sshd_config
RUN echo "root:${ROOT_PASSWORD}" | chpasswd

CMD ["/usr/sbin/sshd", "-D", "-e"]
