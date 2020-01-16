#!/bin/bash

cd /var/www/vialink/wiki
./composer.phar install

service php7.3-fpm start

nginx -g "daemon off;"