FROM php:5.4-apache
MAINTAINER Ing Luis Castillo
RUN apt-get install -y vim
RUN apt-get install -y nginx
RUN apt-get install -y \
	libpq-dev \
	postgresql-client \
	libxml2-dev \
    libldb-dev \
    libldap2-dev \
    libtidy-dev \
    libxslt-dev \
    libpng-dev
RUN ln -s /usr/lib/x86_64-linux-gnu/libldap.so /usr/lib/libldap.so \
    && ln -s /usr/lib/x86_64-linux-gnu/liblber.so /usr/lib/liblber.so
RUN docker-php-ext-install pdo
RUN docker-php-ext-install pdo_pgsql
RUN docker-php-ext-install pgsql
RUN a2enmod rewrite
RUN service apache2 restart
COPY php.ini /usr/local/etc/php/
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
