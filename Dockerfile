FROM php:5.6-apache

RUN apt-get update && \
    apt-get install -y \
        zlib1g-dev libxml2-dev sendmail libpng-dev curl

RUN docker-php-ext-install mysql pdo_mysql soap zip gd mbstring && a2enmod rewrite

RUN curl -sS https://getcomposer.org/installer | php -- \
--install-dir=/usr/bin --filename=composer

COPY ./ /var/www/html