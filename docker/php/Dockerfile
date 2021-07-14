FROM php:7.1-fpm

RUN apt-get update
RUN apt-get install -y git vim nano mc htop zip unzip memcached \
    libzip-dev libmemcached-dev  libmagickwand-dev

#install memcached
RUN git clone -b php7 https://github.com/php-memcached-dev/php-memcached /usr/src/php/ext/memcached \
    && docker-php-ext-configure /usr/src/php/ext/memcached \
        --disable-memcached-sasl \
    && docker-php-ext-install /usr/src/php/ext/memcached \
    && rm -rf /usr/src/php/ext/memcached

#install imagick
RUN pecl install imagick \
	&& docker-php-ext-enable imagick

RUN docker-php-ext-install mbstring zip soap opcache pcntl

ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/

RUN chmod +x /usr/local/bin/install-php-extensions && sync

RUN install-php-extensions pdo-dblib opcache xdebug amqp gd

RUN docker-php-ext-configure pdo_mysql --with-pdo-mysql=mysqlnd \
    && docker-php-ext-configure mysqli --with-mysqli=mysqlnd \
    && docker-php-ext-install pdo_mysql

RUN cp /usr/share/zoneinfo/Europe/Moscow /etc/localtime

#COPY ./php.d /etc/php.d
#COPY ./php.ini /etc/php.ini

RUN mkdir -p /www/vhosts/omp
RUN chown www-data:www-data /www/vhosts/omp
RUN chmod 777 /www/vhosts/omp

#RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
#RUN composer self-update --1

RUN curl -O "https://getcomposer.org/download/1.10.22/composer.phar"
RUN chmod a+x composer.phar
RUN mv composer.phar /usr/local/bin/composer

COPY docker-php-ext-xdebug.ini /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
COPY php.ini /usr/local/etc/php/php.ini

CMD ["php-fpm"]