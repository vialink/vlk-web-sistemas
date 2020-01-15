FROM ubuntu:16.04
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get upgrade -y && apt-get install software-properties-common -y

RUN export LC_ALL=C.UTF-8 && export LANG=C.UTF-8 && add-apt-repository ppa:ondrej/php -y && apt-get update && apt-get upgrade -y

RUN apt-get install nginx-full uwsgi uwsgi-core uwsgi-plugin-python vim php7.3 python-setuptools \
    python-pip -y php7.3-fpm

RUN pip install Django==1.3.7

VOLUME [ "/etc/uwsgi", "/etc/nginx", "/var/www" ]

EXPOSE 80 443

CMD ["nginx", "-g", "daemon off;"]