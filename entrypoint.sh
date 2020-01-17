#!/bin/bash

cd /var/www/vialink/wiki
./composer.phar install

cp /root/libmysqlclient.so.18 /usr/lib/x86_64-linux-gnu/
cd /usr/lib/x86_64-linux-gnu
chmod 755 libmysqlclient.so.18
ldconfig

service uwsgi start

service php7.3-fpm start

nginx -g "daemon off;"