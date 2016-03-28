FROM ubuntu

MAINTAINER Yee Siang “exiang83@yahoo.com”

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get install software-properties-common -y

RUN apt-get install -y language-pack-en-base -y
RUN sudo LC_ALL=en_US.UTF-8 add-apt-repository ppa:ondrej/php -y

RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install apache2 -y

RUN apt-get -y install php7.0 php7.0-gd php-pear php-apc curl lynx-cur libapache2-mod-php7.0 php7.0-mysql php7.0-curl php7.0-json

RUN a2enmod rewrite

EXPOSE 80 3306

ADD www /var/www/html
CMD /usr/sbin/apache2ctl -D FOREGROUND
