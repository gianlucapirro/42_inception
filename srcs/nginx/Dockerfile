# Dockerfile for nginx

FROM debian:buster

# Install necessary packages
RUN apt-get update && \
    apt-get install -y nginx openssl

# Copy configuration file
COPY nginx.conf /etc/nginx/sites-available/default

# Create SSL certificate and key
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -subj "/C=US/ST=California/L=Mountain View/O=42/CN=${DOMAIN_NAME}" \
    -keyout /etc/ssl/private/nginx-selfsigned.key \
    -out /etc/ssl/certs/nginx-selfsigned.crt

# Expose ports
EXPOSE 443

# Start NGINX
CMD ["nginx", "-g", "daemon off;"]
