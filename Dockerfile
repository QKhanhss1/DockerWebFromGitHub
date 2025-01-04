# Use the official PHP image as a base image
FROM php:7.4-apache

# Install git
RUN apt-get update && apt-get install -y git

# Set the working directory
WORKDIR /var/www/html

# Set the correct permissions 
RUN rm -rf /var/www/html/*


# Clone the repository using a personal access token
#ARG GITHUB_TOKEN
RUN git clone --verbose https://github.com/vqhungnew/docker4beginners /var/www/html

RUN chown -R www-data:www-data /var/www/html 
RUN chmod -R 755 /var/www/html

# Install any dependencies (if needed)
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Copy custom Apache configuration
#COPY vhost.conf /etc/apache2/sites-available/000-default.conf

# Enable the site
#RUN a2ensite 000-default.conf

# Expose port 80
EXPOSE 80

# Start Apache server
CMD ["apache2-foreground"]
