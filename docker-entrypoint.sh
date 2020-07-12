#!/bin/bash

# timezone
ln -sf /usr/share/zoneinfo/${TZ:-"Asia/Shanghai"} /etc/localtime
echo ${TZ:-"Asia/Shanghai"} > /etc/timezone

# get pic_url
if echo "$PIC_URL" | grep -q -i "^http"; then
  wget --no-check-certificate $PIC_URL -O /var/www/html/pic.txt
  rm -f /pic.txt
else
  mv /pic.txt /var/www/html/pic.txt
fi

sed -i "s|listen 80|listen ${PORT:-80}|" /etc/nginx/conf.d/default.conf

php-fpm & nginx '-g daemon off;'