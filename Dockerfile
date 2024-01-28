# Php 8
ARG BASE_IMAGE=joomla:4.3.3-php8.0-apache
FROM ${BASE_IMAGE}

# Install git
RUN apt-get update && apt-get install -y \
	git \
	&& git config --global user.name "${GIT_NAME}" \
	&& git config --global user.email "${GIT_EMAIL}"

# Installieren von Netzwerk-Tools
RUN apt-get update && apt-get install -y \
	golang \ 
	zip \
	wget \
	gnupg2 \
	nano \
	net-tools \
	iputils-ping \
	telnet \
	curl \
	netcat \
	python3 \
	python3-pip \
	&& apt-get clean && rm -rf /var/lib/apt/lists/*

# Google Chrome GPG-Schlüssel hinzufügen
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -

# Google Chrome Repository hinzufügen
RUN sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'

# Google Chrome installieren
RUN apt-get update && apt-get install -y google-chrome-stable
RUN pip3 install selenium

# Install xdebug
RUN pecl install xdebug \
	&& docker-php-ext-enable xdebug 

# Install mhsendmail (php sendmail to SMTP for Mailhog)
RUN go get github.com/mailhog/mhsendmail

# Install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Install PHPUnit (über Composer global)
RUN composer global require phpunit/phpunit

# PHP_CodeSniffer installieren
RUN curl -OL https://squizlabs.github.io/PHP_CodeSniffer/phpcs.phar \
	&& chmod +x phpcs.phar \
	&& mv phpcs.phar /usr/local/bin/phpcs

# Joomla Coding Standards für PHP_CodeSniffer installieren
RUN git clone https://github.com/joomla/coding-standards.git /path/to/joomla-coding-standards \
	&& phpcs --config-set installed_paths /path/to/joomla-coding-standards

VOLUME [ "/var/www/html/", "/var/log/apache2/", "/root"	] 
RUN chgrp www-data /var/www/html/ -R

ADD start.sh /
RUN chmod +x /start.sh
CMD ["/start.sh"]
