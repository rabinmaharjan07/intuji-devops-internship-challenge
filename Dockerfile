# Use the official PHP image with Apache
FROM php:8.2-apache

# Set working directory inside the container
WORKDIR /var/www/html

# Install necessary PHP extensions, set timezone, and install Composer
RUN apt-get update && apt-get install -y \
    tzdata curl unzip \
    && echo "UTC" > /etc/timezone \
    && dpkg-reconfigure -f noninteractive tzdata \
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Copy project files into the container
COPY . .

# Install PHP dependencies
RUN composer install --no-dev --optimize-autoloader

# Set proper permissions
RUN chown -R www-data:www-data /var/www/html

# Set the PHP timezone to Nepal Time (Asia/Kathmandu)
RUN echo "date.timezone=Asia/Kathmandu" > /usr/local/etc/php/conf.d/timezone.ini

# Expose port 80
EXPOSE 80

# Start Apache (default CMD for php:*-apache images)
CMD ["apache2-foreground"]
