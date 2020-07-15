FROM alpine:3.11.6

LABEL maintainer="Ztj <ztj1993@gmail.com>"

ENV SSH_ROOT_PASSWORD="123456"

RUN apk add --no-cache openssh-server openssh-sftp-server \
  && ssh-keygen -q -N "" -t dsa -f /etc/ssh/ssh_host_dsa_key \
  && ssh-keygen -q -N "" -t rsa -f /etc/ssh/ssh_host_rsa_key \
  && sed -i "s@^#PermitRootLogin.*@PermitRootLogin yes@" /etc/ssh/sshd_config \
  && sed -i "s@^PermitRootLogin.*@PermitRootLogin yes@" /etc/ssh/sshd_config \
  && sed -i "s@^PasswordAuthentication.*@PasswordAuthentication yes@" /etc/ssh/sshd_config \
  && sed -i "s@^AllowTcpForwarding.*@AllowTcpForwarding yes@" /etc/ssh/sshd_config \
  && sed -i "s@^GatewayPorts.*@GatewayPorts yes@" /etc/ssh/sshd_config

COPY rootfs /

RUN chmod +x /entrypoint.sh

EXPOSE 22

ENTRYPOINT ["/entrypoint.sh"]

CMD ["/usr/sbin/sshd", "-D", "-e"]
