FROM php:7.4-cli
COPY . /usr/src/myapp
WORKDIR /usr/src/myapp
RUN chmod +x docker-entrypoint.sh
RUN apt update && apt install zip unzip
RUN docker-php-ext-install pdo_mysql
RUN docker-php-ext-enable pdo_mysql
ENTRYPOINT [ "./docker-entrypoint.sh" ]
CMD [ "php", "artisan", "serve", "--host", "0.0.0.0" ]
