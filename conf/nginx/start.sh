#!/bin/sh

# This script is a workaround for the www-data user not existing on the current
# Nginx Alpine Docker image from Docker Library:
#
# https://github.com/nginxinc/docker-nginx/blob/e117bd83e9befe5582bc1da8f72248398fffa16c/stable/alpine/Dockerfile
#

exists() {
  getent $1 $2 >/dev/null 2>&1
  return $?
}

# 82 is the standard uid/gid for "www-data" in Alpine
# http://git.alpinelinux.org/cgit/aports/tree/main/nginx-initscripts/nginx-initscripts.pre-install?h=v3.3.2
if ! exists group www-data; then
  addgroup -g 82 -S www-data 2>/dev/null
fi

if ! exists passwd www-data; then
  adduser -u 82 -D -S -G www-data www-data 2>/dev/null
fi

exec nginx -g 'daemon off;'
