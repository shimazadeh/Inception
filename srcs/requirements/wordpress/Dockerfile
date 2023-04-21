FROM debian:buster
RUN apt-get update -y && \
    apt-get install curl mariadb-client php php7.3 php7.3-fpm php7.3-mysql php-common php7.3-cli php7.3-common php7.3-json php7.3-opcache php7.3-readline php-curl php-gd php-intl php-mbstring php-soap php-xml php-xmlrpc php-zip php7.3-imap gettext-base -y

RUN mkdir -p /var/www/wordpress && \
    mkdir -p /run/php && \
    mkdir -p /var/www/wordpress ; mkdir -p /run/php && \
    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp

COPY ./conf/php.conf /etc/php/7.3/fpm/pool.d/www.conf
COPY ./conf/script_wp.sh /
WORKDIR /var/www/wordpress

RUN wp core download --allow-root

ENTRYPOINT ["bash", "/script_wp.sh"]

CMD ["php-fpm7.3", "-F"]