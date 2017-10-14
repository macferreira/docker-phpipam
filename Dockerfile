FROM nginx:1.13.5
MAINTAINER Miguel Ferreira <miguel.correiaferreira@gmail.com>

# ENV Vars
ENV DB_HOST 'localhost'
ENV DB_USER 'phpipam'
ENV DB_PASS 'phpipamadmin'
ENV DB_NAME 'phpipam'
ENV DB_PORT 3306
ENV DB_SSL false
ENV DB_SSL_KEY '\/path\/to\/cert.key'
ENV DB_SSL_CERT '\/path\/to\/cert.crt'
ENV DB_SSL_CA '\/path\/to\/ca.crt'
ENV DB_SSL_CAPATH '\/path\/to\/ca_certs'
ENV DB_SSL_CIPHER '\/DHE-RSA-AES256-SHA:AES128-SHA'
ENV DB_TMPTABLE_ENGINE_TYPE 'MEMORY'
ENV CONFIG_PING_CHECK_SEND_EMAIL true
ENV CONFIG_PING_CHECK_METHOD false
ENV CONFIG_DISCOVERY_CHECK_SEND_MAIL true
ENV CONFIG_DISCOVERY_CHECK_METHOD false
ENV CONFIG_REMOVED_ADDRESSES_SEND_MAIL true
ENV CONFIG_REMOVED_ADDRESSES_TIMELIMIT 604800
ENV CONFIG_RESOLVE_EMPTYONLY true
ENV CONFIG_RESOLVE_VERBOSE true
ENV DEBUGGING false
ENV PHPSESSNAME 'phpipam'
ENV GMAPS_API_KEY ''
ENV PROXY_ENABLED false
ENV PROXY_SERVER 'myproxy.something.com'
ENV PROXY_PORT '8080'
ENV PROXY_USER 'USERNAME'
ENV PROXY_PASS 'PASSWORD'
ENV PROXY_USE_AUTH false

# Copy nginx conf
COPY ./http.conf /etc/nginx/conf.d/default.conf

# Install PHP and needed packages
RUN apt-get update && apt-get -y install \
    nginx \
    php-fpm \
    php-cli \
    php-mysql \
    php-curl \
    php-mcrypt \
    php-gd \
    php-pear \
    php-gettext \
    php-gmp \
    php-ldap \
    php-json \
    php-net-socket \
    libgmp-dev \
    libmcrypt-dev \
    libfreetype6-dev \
    libjpeg-dev \
    libldap2-dev && \
    sed -i -e "s/listen = \/run\/php\/php7.0-fpm.sock/listen = 127.0.0.1:9000/g" /etc/php/7.0/fpm/pool.d/www.conf

# Add phpipam code
ADD phpipam/ /var/www/html/

# Copy config.dist.php to config.php
RUN cp /var/www/html/config.dist.php /var/www/html/config.php

EXPOSE 80

# Add the startup script and run it
ADD ./run.sh /root/run.sh
RUN chmod +x /root/run.sh
CMD /root/run.sh
