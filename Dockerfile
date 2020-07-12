FROM php:fpm-alpine

COPY docker-entrypoint.sh php.ini default.conf pic.txt index.php /
RUN apk add --no-cache \
        git \
        bash \
        nginx \
        tzdata \
        openssh && \
    mkdir -p /run/nginx && \
    mv /default.conf /etc/nginx/conf.d && \
    mv /php.ini /usr/local/etc/php && \
    mv /index.php /var/www/html && \
    mv /pic.txt /var/www/html && \
    chmod +x /docker-entrypoint.sh && \
    ssh-keygen -A

EXPOSE 80
# Persistent
VOLUME [ "/var/www/html" ]
ENTRYPOINT [ "/docker-entrypoint.sh" ]