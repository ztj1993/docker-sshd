FROM panubo/sshd:1.2.0

LABEL maintainer="Ztj <ztj1993@gmail.com>"

ENV ROOT_PASSWORD="123456"
ENV SSH_ENABLE_ROOT="false"
ENV SSH_ENABLE_PASSWORD_AUTH="true"

RUN echo "---------- PermitRootLogin ----------" \
  && echo "set /files/etc/ssh/sshd_config/PermitRootLogin yes" | augtool -s 1> /dev/null \
  && echo "---------- Root Password ----------" \
  && echo "RootPassword: ${ROOT_PASSWORD}" \
  && echo "root:${ROOT_PASSWORD}" | chpasswd
