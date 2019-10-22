FROM debian:buster
LABEL maintainer="LiveXP <dev@livexp.fr>"

ENV DEBIAN_FRONTEND="noninteractive"

RUN apt-get update -q && apt-get install -qy --no-install-recommends \
	curl=7.64.0-4 \
    php7.3 \
    php7.3-curl \
    php7.3-ldap \
    php7.3-apcu \
    php7.3-gd \
    php7.3-gmp \
    php7.3-intl \
    php7.3-yaml \
    php7.3-xdebug \
    php7.3-common \
    php7.3-json \
    php7.3-mbstring \
    php7.3-phar \
    php7.3-xml \
    php7.3-zip \
	nodejs=10.15.2~dfsg-2 \
	npm=5.8.0+ds6-4 \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/*

RUN npm install -g yarn@1.19.1

RUN cp /usr/share/zoneinfo/Europe/Paris /etc/localtime && echo "Europe/Paris" > /etc/timezone

SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

CMD ["bash"]