FROM debian:buster
RUN apt update && \
    apt install nginx vim curl openssl -y

RUN mkdir -p /etc/nginx/ssl && \
    openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=shabibol.42.fr/UID=shabibol" && \
    mkdir -p /var/run/nginx

RUN rm /etc/nginx/sites-available/default
RUN rm /etc/nginx/sites-enabled/default

COPY conf/nginx.conf /etc/nginx/sites-enabled/shabibol.42.fr

RUN chmod 755 /var/www/html && \ 
    chown -R www-data:www-data /var/www/html 
CMD [ "nginx", "-g", "daemon off;" ]