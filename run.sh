#!/usr/bin/env bash

sed -i -e "s/\$db\['host'\] = 'localhost';/\$db\['host'\] = '${DB_HOST}';/g" /var/www/html/config.php
sed -i -e "s/\$db\['user'\] = 'phpipam';/\$db\['user'\] = '${DB_USER}';/g" /var/www/html/config.php
sed -i -e "s/\$db\['pass'\] = 'phpipamadmin';/\$db\['pass'\] = '${DB_PASS}';/g" /var/www/html/config.php
sed -i -e "s/\$db\['name'\] = 'phpipam';/\$db\['name'\] = '${DB_NAME}';/g" /var/www/html/config.php
sed -i -e "s/\$db\['port'\] = 3306;/\$db\['port'\] = ${DB_PORT};/g" /var/www/html/config.php
sed -i -e "s/\$db\['ssl'\]        = false;/\$db\['ssl'\] = ${DB_SSL};/g" /var/www/html/config.php
sed -i -e "s/\$db\['ssl_key'\]    = '\/path\/to\/cert.key';/\$db\['ssl_key'\] = '${DB_SSL_KEY}';/g" /var/www/html/config.php
sed -i -e "s/\$db\['ssl_cert'\]   = '\/path\/to\/cert.crt';/\$db\['ssl_cert'\] = '${DB_SSL_CERT}';/g" /var/www/html/config.php
sed -i -e "s/\$db\['ssl_ca'\]     = '\/path\/to\/ca.crt';/\$db\['ssl_ca'\] = '${DB_SSL_CA}';/g" /var/www/html/config.php
sed -i -e "s/\$db\['ssl_capath'\] = '\/path\/to\/ca_certs';/\$db\['ssl_capath'\] = '${DB_SSL_CAPATH}';/g" /var/www/html/config.php
sed -i -e "s/\$db\['ssl_cipher'\] = '\/DHE-RSA-AES256-SHA:AES128-SHA';/\$db\['ssl_cipher'\] = '${DB_SSL_CIPHER}';/g" /var/www/html/config.php
sed -i -e "s/\$db\['tmptable_engine_type'\] = \"MEMORY\";/\$db\['tmptable_engine_type'\] = '${DB_TMPTABLE_ENGINE_TYPE}';/g" /var/www/html/config.php
sed -i -e "s/\$config\['ping_check_send_mail'\]        = true;/\$config['ping_check_send_mail'] = ${CONFIG_PING_CHECK_SEND_EMAIL};/g" /var/www/html/config.php
sed -i -e "s/\$config\['ping_check_method'\]           = false;/\$config\['ping_check_method'\] = ${CONFIG_PING_CHECK_METHOD};/g" /var/www/html/config.php
sed -i -e "s/\$config\['discovery_check_send_mail'\]   = true;/\$config\['discovery_check_send_mail'\] = ${CONFIG_DISCOVERY_CHECK_SEND_MAIL};/g" /var/www/html/config.php
sed -i -e "s/\$config\['discovery_check_method'\]      = false;/\$config\['discovery_check_method'\] = ${CONFIG_DISCOVERY_CHECK_METHOD};/g" /var/www/html/config.php
sed -i -e "s/\$config\['removed_addresses_send_mail'\] = true;/\$config\['removed_addresses_send_mail'\] = ${CONFIG_REMOVED_ADDRESSES_SEND_MAIL};/g" /var/www/html/config.php
sed -i -e "s/\$config\['removed_addresses_timelimit'\] = 86400 \* 7;/\$config\['removed_addresses_timelimit'\] = ${CONFIG_REMOVED_ADDRESSES_TIMELIMIT};/g" /var/www/html/config.php
sed -i -e "s/\$config\['resolve_emptyonly'\]           = true;/\$config\['resolve_emptyonly'\] = ${CONFIG_RESOLVE_EMPTYONLY};/g" /var/www/html/config.php
sed -i -e "s/\$config\['resolve_verbose'\]             = true;/\$config\['resolve_verbose'\]= ${CONFIG_RESOLVE_VERBOSE};/g" /var/www/html/config.php
sed -i -e "s/\$debugging = false;/\$debugging = ${DEBUGGING};/g" /var/www/html/config.php
sed -i -e "s/\$phpsessname = \"phpipam\";/\$phpsessname = '${DEBUGGING}';/g" /var/www/html/config.php
sed -i -e "s/\$gmaps_api_key = \"\";/\$gmaps_api_key = '${GMAPS_API_KEY}';/g" /var/www/html/config.php
sed -i -e "s/\$proxy_enabled  = false;/\$proxy_enabled = ${PROXY_ENABLED};/g" /var/www/html/config.php
sed -i -e "s/\$proxy_server   = 'myproxy.something.com';/\$proxy_server = '${PROXY_SERVER}';/g" /var/www/html/config.php
sed -i -e "s/\$proxy_port     = '8080';/\$proxy_port = '${PROXY_PORT}';/g" /var/www/html/config.php
sed -i -e "s/\$proxy_user     = 'USERNAME';/\$proxy_user = '${PROXY_USER}';/g" /var/www/html/config.php
sed -i -e "s/\$proxy_pass     = 'PASSWORD';/\$proxy_pass = '${PROXY_PASS}';/g" /var/www/html/config.php
sed -i -e "s/\$proxy_use_auth = false;/\$proxy_use_auth = ${PROXY_USE_AUTH};/g" /var/www/html/config.php

/etc/init.d/php7.0-fpm start
nginx -g "daemon off;"
