FROM ubuntu:14.04.1
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get upgrade -y && apt-get install software-properties-common -y

RUN export LC_ALL=C.UTF-8 && export LANG=C.UTF-8 && add-apt-repository ppa:ondrej/php -y && apt-get update && apt-get upgrade -y

RUN apt-get install nginx-full uwsgi uwsgi-core uwsgi-plugin-python vim  python-setuptools \
    python-pip -y  php-net-ipv4 python-virtualenv  && \
    libmysqlclient18 libmysqlclient-dev

#RUN apt-get install -y php7.1 php7.1-fpm php7.1-mbstring php7.1-xml php7.1-mysql virtualenv composer

RUN pip install Django==1.4.0

VOLUME [ "/etc/uwsgi", "/etc/nginx", "/var/www" ]

EXPOSE 80 443

COPY entrypoint.sh ./entrypoint.sh

ENTRYPOINT [ "bash", "entrypoint.sh" ]