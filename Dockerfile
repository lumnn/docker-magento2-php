FROM php:7.1
MAINTAINER Kamil <lumnn@mailfence.com>

RUN apt-get update
# GD dependencies
RUN apt-get install -y \
  libfreetype6-dev \
  libjpeg62-turbo-dev \
  libpng-dev

# intl dependencies
RUN apt-get install -y \
  libicu-dev

# simplexml dependencies
RUN apt-get install -y \
  libxml2
  
# xsl dependencies
RUN apt-get install -y \
  libxslt1-dev

# composer dependencies
RUN apt-get install -y \
  unzip

RUN docker-php-ext-configure \
  gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/

RUN docker-php-ext-install \
  bcmath \
  gd \
  intl \
  pdo_mysql \
  soap \
  xsl \
  zip

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
