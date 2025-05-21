FROM php:5.6-apache

# repositories and dependencies
RUN echo "deb http://archive.debian.org/debian/ stretch main" > /etc/apt/sources.list \
    && echo "deb http://archive.debian.org/debian-security/ stretch/updates main" >> /etc/apt/sources.list \
    && echo 'Acquire::Check-Valid-Until "false";' > /etc/apt/apt.conf.d/99no-check-valid-until \
    && echo 'APT::Get::AllowUnauthenticated "true";' > /etc/apt/apt.conf.d/99allow-unauth \
    && apt-get clean \
    && apt-get update -o Acquire::CompressionTypes::Order::=gz \
    && apt-get install -y --no-install-recommends gettext

# Install PHP extensions
RUN docker-php-ext-install mysqli gettext

# Configure PHP sessions
RUN echo "session.save_handler=files" > /usr/local/etc/php/conf.d/session.ini \
    && echo "session.save_path=/var/lib/php/sessions" >> /usr/local/etc/php/conf.d/session.ini \
    && echo "session.cookie_httponly=On" >> /usr/local/etc/php/conf.d/session.ini

# Configure sessions directory and permissions
RUN mkdir -p /var/lib/php/sessions \
    && chown -R www-data:www-data /var/lib/php/sessions \
    && chmod 1733 /var/lib/php/sessions \
    && chown -R www-data:www-data /var/www/html

# Enable Apache mod_rewrite
RUN a2enmod rewrite