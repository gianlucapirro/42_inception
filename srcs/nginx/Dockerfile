FROM debian:buster

RUN apt-get update && \
    apt-get install -y nginx openssl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# COPY nginx.conf /etc/nginx/nginx.conf

RUN mkdir /etc/nginx/certs && \
    openssl req -x509 -newkey rsa:4096 -keyout /etc/nginx/certs/server.key -out /etc/nginx/certs/server.crt -days 3650 -nodes -subj '/CN=localhost'

RUN chmod 644 /etc/nginx/certs/server.crt
RUN chmod 644 /etc/nginx/certs/server.key

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
