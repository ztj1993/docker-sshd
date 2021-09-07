FROM ubuntu:20.04

LABEL maintainer="Ztj <ztj1993@gmail.com>"

ADD entrypoint.sh /

RUN set -x \
  && apt-get -y update \
  && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends openssh-server \
  && rm -rf /var/lib/apt/lists/* \
  && mkdir /run/sshd \
  && sed -i "s@^#PermitRootLogin.*@PermitRootLogin yes@" /etc/ssh/sshd_config \
  && sed -i "s@^PasswordAuthentication.*@PasswordAuthentication yes@" /etc/ssh/sshd_config \
  && sed -i "s@^AllowTcpForwarding.*@AllowTcpForwarding yes@" /etc/ssh/sshd_config \
  && sed -i "s@^GatewayPorts.*@GatewayPorts yes@" /etc/ssh/sshd_config \
  && chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D", "-e"]
