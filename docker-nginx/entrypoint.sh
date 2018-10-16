#!/bin/bash
set -e
sed -i "s/ENV/${ENV}/g" /etc/nginx/nginx.conf
LOG_PATH=${LOG_PATH:-"/var/log/nginx"}
sed -i 's@LOG_PATH@'"$LOG_PATH"'@g' /etc/nginx/nginx.conf
ln -sf /dev/stdout $LOG_PATH/access.log && ln -sf /dev/stderr $LOG_PATH/error.log
exec nginx -g 'daemon off;' "$@"
