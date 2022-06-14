# โหลด Base Image PHP 8.0.19-fpm-buster
FROM php:8.0.19-fpm-buster

# ติดตั้ง Extension bcmath  และ pdo_mysql สำหรับ Laravel 7, 8, 9 และ 10
RUN docker-php-ext-install bcmath pdo_mysql

# สั่ง update image และ ติดตั้ง git zip และ unzip pacakage
RUN apt-get update
RUN apt-get install -y git zip unzip

# ติดตั้ง NodeJS
RUN curl -sL https://deb.nodesource.com/setup_16.x | bash - 
RUN apt-get install -y nodejs

# Copy file composer:latest ไว้ที่ /usr/bin/composer
COPY --from=composer:2.3 /usr/bin/composer /usr/bin/composer

# Set working directory
WORKDIR /var/www

EXPOSE 9000