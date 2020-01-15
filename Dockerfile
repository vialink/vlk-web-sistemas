FROM ubuntu:14.04
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get upgrade -y

RUN add-apt-repository ppa:ondrej/php && apt-get update

RUN apt-get install nginx-full uwsgi uwsgi-core uwsgi-plugin-python vim php7.3 php7.3-fpm php7.3-mysql  python-setuptools \
    python-pip 

RUN pip install Django==1.3.7

VOLUME [ "/etc/uwsgi", "/etc/nginx", "/var/www" ]

EXPOSE 80 443

CMD ["nginx", "-g", "daemon off;"]