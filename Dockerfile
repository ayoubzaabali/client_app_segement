FROM php:8.1-apache 
 
 
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer 
 
WORKDIR /var/www/html 
 
COPY ./app /var/www/html 
 
RUN composer install 
 
COPY ./web /etc/apache2/sites-available/000-default.conf 
 
RUN a2enmod rewrite 
 
RUN chown -R www-data:www-data /var/www/html/storage /var/www/html/bootstrap/cache 
 
EXPOSE 80 
 
CMD ["apache2-foreground"] 
