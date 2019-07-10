FROM centos:6

COPY RPM-GPG-KEY-remi /etc/pki/rpm-gpg/
COPY *.repo /etc/yum.repos.d/

COPY --from=composer:1.8 /usr/bin/composer /usr/local/bin/composer

RUN yum -y install epel-release centos-release-scl && \
    yum -y install \
        tuleap \
        httpd24-httpd \
        mysql-server \
        php72-php-mysqlnd \
        php72-php-pdo \
        php72-php-xml \
        php72-php-mbstring \
        php72-php-gd \
        php72-php-soap \
        php72-php-pear \
        php72-php-intl \
        php72-php-process \
        php72-php-cli \
        php72-php-bcmath \
        php72-php-fpm \
        php72-php-opcache \
        php72-php-pecl-jsonc \
        php73-php-mysqlnd \
        php73-php-pdo \
        php73-php-xml \
        php73-php-mbstring \
        php73-php-gd \
        php73-php-soap \
        php73-php-pear \
        php73-php-intl \
        php73-php-process \
        php73-php-cli \
        php73-php-bcmath \
        php73-php-fpm \
        php73-php-opcache \
        php73-php-pecl-jsonc \
    && \
    yum remove -y tuleap \
        tuleap-core-subversion \
        tuleap-core-subversion-modperl \
        tuleap-documentation && \
    yum clean all

ENV PHP_VERSION 72

CMD /usr/share/tuleap/tests/soap/bin/run.sh
