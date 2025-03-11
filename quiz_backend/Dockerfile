FROM php:8.1-fpm
WORKDIR /var/www
RUN apt update && apt install -y unzip curl libpng-dev \
    && docker-php-ext-install pdo pdo_mysql gd
COPY . .
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN composer install --no-dev --optimize-autoloader
CMD php artisan serve --host=0.0.0.0 --port=8000
EXPOSE 8000
