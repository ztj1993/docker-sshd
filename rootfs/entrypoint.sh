#!/bin/sh

echo "Change root password..."
echo "root:${SSH_ROOT_PASSWORD}" | chpasswd

exec "$@"
