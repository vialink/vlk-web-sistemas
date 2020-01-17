FROM ubuntu:16.04
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get upgrade -y && apt-get install software-properties-common -y

RUN export LC_ALL=C.UTF-8 && export LANG=C.UTF-8 && add-apt-repository ppa:ondrej/php -y && apt-get update && apt-get upgrade -y

RUN apt-get install nginx-full uwsgi uwsgi-core uwsgi-plugin-python vim  python-setuptools \
    python-pip -y  php-net-ipv4 python-virtualenv virtualenv python-requests

RUN apt-get install -y php7.3 php7.3-fpm php7.3-mbstring php7.3-xml php7.3-mysql virtualenv composer

RUN pip install Django==1.3.7

VOLUME [ "/etc/uwsgi", "/etc/nginx", "/var/www" ]

EXPOSE 80 443

COPY entrypoint.sh ./entrypoint.sh
COPY libmysqlclient.so.18 /root/libmysqlclient.so.18

ENTRYPOINT [ "bash", "entrypoint.sh" ]