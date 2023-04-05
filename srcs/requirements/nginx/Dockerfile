FROM debian:latest

# Install Nginx and OpenSSL packages
RUN apt-get update && \
    apt-get install -y nginx openssl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Generate SSL certificate and key files
RUN openssl genrsa -out /etc/ssl/private/server.key 2048 && \
    openssl req -new -key /etc/ssl/private/server.key -out /tmp/cert.csr -subj '/CN=localhost' && \
    openssl x509 -req -days 365 -in /tmp/cert.csr -signkey /etc/ssl/private/server.key -out /etc/ssl/certs/server.crt && \
    rm /tmp/cert.csr

# Copy custom configuration file
COPY conf/nginx.conf /etc/nginx/nginx.conf

# Expose port 443 for HTTPS traffic
EXPOSE 443

# Start Nginx when container starts
CMD ["nginx", "-g", "daemon off;"]
