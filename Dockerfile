FROM ubuntu:14.04
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get upgrade -y

RUN apt-get install nginx-full uwsgi uwsgi-core uwsgi-plugin-python vim vim-tinny php7.3 php7.3-fpm  python-setuptools \
    python-pip 

RUN pip install Django==1.3.7

VOLUME [ "/etc/uwsgi", "/etc/nginx", "/var/www" ]

EXPOSE 80 443

CMD ["nginx", "-g", "daemon off;"]