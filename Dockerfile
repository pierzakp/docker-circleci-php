FROM circleci/php:7.2-cli

MAINTAINER Piotr Pierzak piotrek.pierzak@gmail.com

RUN sudo apt-get update && sudo apt-get install -y \
        libfreetype6-dev \
        libicu-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libpng-dev \
        libxslt1-dev \
    && sudo docker-php-ext-configure \
        gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && sudo docker-php-ext-install \
         bcmath \
         gd \
         intl \
         mbstring \
         opcache \
         pdo_mysql \
         soap \
         xsl \
         zip

RUN composer global require hirak/prestissimo
