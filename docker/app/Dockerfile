FROM php:8.1-fpm
WORKDIR /app
RUN apt-get update && apt-get install -y \
        curl \
        wget \
        git \
        nano \
	supervisor \
    nginx \
    libpng-dev

RUN apt-get install -y \
        libzip-dev \
        libxml2-dev \
        zip && docker-php-ext-install zip

RUN docker-php-ext-install mysqli && \
    docker-php-ext-enable mysqli

RUN docker-php-ext-install gd
RUN apt-get -y update \
&& apt-get install -y libicu-dev \
&& docker-php-ext-configure intl \
&& docker-php-ext-install intl

RUN docker-php-ext-install soap
RUN docker-php-ext-install exif

ADD php.ini /usr/local/etc/php/conf.d/40-custom.ini
ADD supervisor/conf.d/nginx.conf /etc/supervisor/conf.d/nginx.conf
ADD supervisor/conf.d/php-fpm.conf /etc/supervisor/conf.d/php-fpm.conf
#ADD ./logrotate.d/ /etc/logrotate.d/

RUN ln -sf /bin/bash /bin/sh
RUN docker-php-ext-install sockets
RUN apt install logrotate -y

RUN docker-php-ext-install opcache
COPY opcache.ini /usr/local/etc/php/conf.d/opcache.ini

RUN printf "\n" | pecl install --force redis
RUN rm -rf /tmp/pear && docker-php-ext-enable redis

EXPOSE 9000
CMD ["/usr/bin/supervisord", "-n", "-c", "/etc/supervisor/supervisord.conf"]
#service supervisor restart