FROM debian:buster

# Install Nginx and OpenSSL packages
RUN apt update && \
    apt install nginx vim curl openssl -y

# Generate SSL certificate and key files
RUN mkdir -p /etc/nginx/ssl && \
    openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=shabibol.42.fr/UID=shabibol" && \
    mkdir -p /var/run/nginx

# Copy custom configuration file
COPY conf/nginx.conf /etc/nginx/sites-enabled/shabibol.42.fr

RUN chmod 755 /var/www/html && \
    chown -R www-data:www-data /var/www/html

# Start Nginx when container starts
CMD [ "nginx", "-g", "daemon off;" ]
