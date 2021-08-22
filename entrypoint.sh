#!/bin/bash

if [ ! -f /var/log/init-password ]; then
  touch /var/log/init-password
  echo "Change root password..."
  echo "root:${ROOT_INIT_PASSWORD}" | chpasswd
fi

exec "$@"
