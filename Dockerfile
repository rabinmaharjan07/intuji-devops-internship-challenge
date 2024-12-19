# Stage 1: Build Stage
FROM php:8.2-cli as build

# Install system dependencies and Composer
RUN apt-get update && apt-get install -y \
    tzdata curl unzip git \
    && echo "Asia/Kathmandu" > /etc/timezone \
    && dpkg-reconfigure -f noninteractive tzdata \
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Set the working directory for Composer and copy the necessary files
WORKDIR /app

# Copy only necessary files (like composer.json, composer.lock) to install dependencies
COPY composer.json composer.lock ./

# Install PHP dependencies
RUN composer install --no-dev --optimize-autoloader

# Stage 2: Runtime Stage
FROM php:8.2-apache

# Set working directory inside the container
WORKDIR /var/www/html

# Set the timezone to Nepal Time (Asia/Kathmandu)
RUN echo "Asia/Kathmandu" > /etc/timezone \
    && dpkg-reconfigure -f noninteractive tzdata \
    && echo "date.timezone=Asia/Kathmandu" > /usr/local/etc/php/conf.d/timezone.ini

# Install system dependencies required by PHP extensions
RUN apt-get update && apt-get install -y \
    curl unzip git \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Copy the project files from the build stage (including vendor folder from Composer install)
COPY --from=build /app /var/www/html

# Set the correct permissions for the files
RUN chown -R www-data:www-data /var/www/html

# Expose port 80
EXPOSE 80

# Start Apache (default CMD for php:*-apache images)
CMD ["apache2-foreground"]
