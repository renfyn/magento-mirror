FROM php:5.6-apache

RUN apt-get update && \
    apt-get install -y \
        zlib1g-dev libxml2-dev sendmail libpng-dev curl

RUN docker-php-ext-install mysql pdo_mysql soap zip gd mbstring && a2enmod rewrite

RUN curl -sS https://getcomposer.org/installer | php -- \
--install-dir=/usr/bin --filename=composer

COPY ./bin/apache/docker-php-entrypoint /usr/local/bin/

RUN chmod 755 /usr/local/bin/docker-php-entrypoint

COPY ./ /var/www/html

RUN chown -R www-data:www-data .

RUN chmod -R 766 /var/www/html/app/etc
RUN chmod -R 766 /var/www/html/media