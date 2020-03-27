FROM yilutech/cloud9

COPY .bash_profile fpm-logrotate /root/

RUN addgroup -g 82 -S www-data \
 && adduser -u 82 -D -S -G www-data www-data \
 && apk add logrotate \
            php7 \
            php7-bcmath \
            php7-ctype \
            php7-curl \
            php7-dom \
            php7-fileinfo\
            php7-fpm \
            php7-ftp \
            php7-gd \
            php7-gmp \
            php7-iconv \
            php7-json \
            php7-mbstring \
            php7-mcrypt \
            php7-openssl \
            php7-opcache \
            php7-pdo_mysql \
            php7-pdo_sqlite \
            php7-phar \
            php7-pcntl \
	        php7-posix \
            php7-session \
            php7-simplexml \
            php7-sqlite3 \
            php7-tokenizer \
            php7-xml \
            php7-xmlreader \
            php7-xmlwriter \
            php7-zip \
            libbsd \
            openssl \
            openssh-client \
            git \

 && wget https://getcomposer.org/composer-stable.phar -O /usr/local/bin/composer \
 && chmod +x /usr/local/bin/composer \
 && composer config -g repo.packagist composer https://mirrors.aliyun.com/composer/ \
 && sed -i "s|;daemonize = yes|daemonize = no|g" /etc/php7/php-fpm.conf \
 && mv /root/fpm-logrotate /etc/logrotate.d/php-fpm7 \
 && chmod 644 /etc/logrotate.d/php-fpm7
